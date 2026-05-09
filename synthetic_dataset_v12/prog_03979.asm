; DESCRIPTION: Composite: Sets a single red pixel at (293, 188) then Draws a orange rectangle at (41, 212) with width 31 and height 17 then Places a blue line segment connecting (410, 63) to (180, 237).
; PLAN: r0=293(x), r1=188(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=41(x), r6=212(y), r7=31(width), r8=17(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=410(x1), r11=63(y1), r12=180(x2), r13=237(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 293
LDI r1, 188
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 41
LDI r6, 212
LDI r7, 31
LDI r8, 17
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 410
LDI r11, 63
LDI r12, 180
LDI r13, 237
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
