; DESCRIPTION: Composite: . Then Places a red dot at position (227, 103). Then Renders a cyan disk with center (103, 181) and radius 68.
; PLAN: r0=227(x), r1=103(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=103(x), r1=181(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (227, 103).
; PLAN: r0=227(x), r1=103(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 227
LDI r1, 103
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan disk with center (103, 181) and radius 68.
; PLAN: r0=103(x), r1=181(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 181
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
