; DESCRIPTION: Composite: Renders a white disk with center (146, 146) and radius 54 then Places a yellow 21x99 rectangle at position (193, 144) then Sets a single yellow pixel at (328, 69).
; PLAN: r0=146(x), r1=146(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x), r6=144(y), r7=21(width), r8=99(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=328(x), r11=69(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 146
LDI r1, 146
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 144
LDI r7, 21
LDI r8, 99
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 328
LDI r11, 69
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
