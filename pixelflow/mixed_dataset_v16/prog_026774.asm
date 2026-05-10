; DESCRIPTION: Composite: Draws a cyan circle centered at (198, 144) with radius 47 then Places a green dot at position (475, 171) then Places a blue line segment connecting (480, 36) to (180, 62).
; PLAN: r0=198(x), r1=144(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=475(x), r6=171(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=480(x1), r11=36(y1), r12=180(x2), r13=62(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 198
LDI r1, 144
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 475
LDI r6, 171
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 480
LDI r11, 36
LDI r12, 180
LDI r13, 62
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
