; DESCRIPTION: Composite: Draws a red line from (350, 30) to (48, 30) then Places a white circle of radius 42 at center (295, 130) then Places a blue dot at position (335, 98).
; PLAN: r0=350(x1), r1=30(y1), r2=48(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=295(x), r6=130(y), r7=42(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=335(x), r11=98(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 350
LDI r1, 30
LDI r2, 48
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 130
LDI r7, 42
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 335
LDI r11, 98
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
