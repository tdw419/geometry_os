; DESCRIPTION: Composite: Draws a orange rectangle at (256, 13) with width 38 and height 111 then Places a black line segment connecting (385, 59) to (420, 68) then Sets a single cyan pixel at (454, 167).
; PLAN: r0=256(x), r1=13(y), r2=38(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=385(x1), r6=59(y1), r7=420(x2), r8=68(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=454(x), r11=167(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 256
LDI r1, 13
LDI r2, 38
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 59
LDI r7, 420
LDI r8, 68
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 454
LDI r11, 167
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
