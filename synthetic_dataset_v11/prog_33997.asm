; DESCRIPTION: Composite: . Then Renders a cyan disk with center (148, 195) and radius 38. Then Places a red dot at position (170, 187).
; PLAN: r0=148(x), r1=195(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=170(x), r1=187(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan disk with center (148, 195) and radius 38.
; PLAN: r0=148(x), r1=195(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 195
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (170, 187).
; PLAN: r0=170(x), r1=187(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 187
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
