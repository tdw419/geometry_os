; DESCRIPTION: Composite: Places a magenta 80x51 rectangle at position (239, 193) then Draws a orange line from (435, 141) to (472, 251).
; PLAN: r0=239(x), r1=193(y), r2=80(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x1), r6=141(y1), r7=472(x2), r8=251(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 193
LDI r2, 80
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 141
LDI r7, 472
LDI r8, 251
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
