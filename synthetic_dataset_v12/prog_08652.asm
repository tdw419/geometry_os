; DESCRIPTION: Composite: Places a cyan line segment connecting (56, 242) to (443, 210) then Renders a blue disk with center (467, 176) and radius 18.
; PLAN: r0=56(x1), r1=242(y1), r2=443(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=176(y), r7=18(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 56
LDI r1, 242
LDI r2, 443
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 176
LDI r7, 18
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
