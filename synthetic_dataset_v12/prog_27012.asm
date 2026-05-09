; DESCRIPTION: Composite: Places a orange dot at position (360, 108) then Places a black line segment connecting (463, 28) to (363, 220) then Renders a white disk with center (242, 150) and radius 59.
; PLAN: r0=360(x), r1=108(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=463(x1), r6=28(y1), r7=363(x2), r8=220(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=242(x), r11=150(y), r12=59(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 360
LDI r1, 108
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 463
LDI r6, 28
LDI r7, 363
LDI r8, 220
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 242
LDI r11, 150
LDI r12, 59
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
