; DESCRIPTION: Composite: Draws a blue line from (74, 248) to (502, 233) then Draws a cyan rectangle at (202, 77) with width 69 and height 104 then Places a orange circle of radius 56 at center (433, 132).
; PLAN: r0=74(x1), r1=248(y1), r2=502(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=77(y), r7=69(width), r8=104(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=433(x), r11=132(y), r12=56(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 74
LDI r1, 248
LDI r2, 502
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 77
LDI r7, 69
LDI r8, 104
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 433
LDI r11, 132
LDI r12, 56
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
