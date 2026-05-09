; DESCRIPTION: Composite: . Then Renders a yellow disk with center (82, 168) and radius 16. Then Places a red dot at position (227, 94).
; PLAN: r0=82(x), r1=168(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=227(x), r1=94(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow disk with center (82, 168) and radius 16.
; PLAN: r0=82(x), r1=168(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 168
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (227, 94).
; PLAN: r0=227(x), r1=94(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 227
LDI r1, 94
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
