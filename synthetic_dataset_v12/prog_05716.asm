; DESCRIPTION: Renders a red disk with center (370, 179) and radius 16.
; PLAN: r0=370(x), r1=179(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 179
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
