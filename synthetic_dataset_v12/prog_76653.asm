; DESCRIPTION: Composite: Places a red line segment connecting (303, 60) to (425, 28) then Renders a blue disk with center (182, 222) and radius 12 then Sets a single green pixel at (337, 63).
; PLAN: r0=303(x1), r1=60(y1), r2=425(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=182(x), r6=222(y), r7=12(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=337(x), r11=63(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 303
LDI r1, 60
LDI r2, 425
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 222
LDI r7, 12
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 337
LDI r11, 63
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
