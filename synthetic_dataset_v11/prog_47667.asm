; DESCRIPTION: Composite: . Then Renders a black box of size 83x31 starting at (169, 179). Then Renders a cyan disk with center (125, 212) and radius 37.
; PLAN: r0=169(x), r1=179(y), r2=83(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=125(x), r1=212(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black box of size 83x31 starting at (169, 179).
; PLAN: r0=169(x), r1=179(y), r2=83(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 179
LDI r2, 83
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan disk with center (125, 212) and radius 37.
; PLAN: r0=125(x), r1=212(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 212
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
