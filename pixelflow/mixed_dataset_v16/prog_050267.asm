; DESCRIPTION: Composite: Renders a green disk with center (242, 176) and radius 41 then Places a yellow line segment connecting (487, 149) to (339, 92).
; PLAN: r0=242(x), r1=176(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=487(x1), r6=149(y1), r7=339(x2), r8=92(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 176
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 487
LDI r6, 149
LDI r7, 339
LDI r8, 92
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
