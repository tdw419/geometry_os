; DESCRIPTION: Composite: Renders a green disk with center (242, 102) and radius 27 then Places a cyan line segment connecting (416, 118) to (149, 49).
; PLAN: r0=242(x), r1=102(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=416(x1), r6=118(y1), r7=149(x2), r8=49(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 102
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 416
LDI r6, 118
LDI r7, 149
LDI r8, 49
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
