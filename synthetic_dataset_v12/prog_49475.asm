; DESCRIPTION: Composite: Places a blue line segment connecting (413, 250) to (60, 94) then Places a green dot at position (359, 161) then Places a blue 103x95 rectangle at position (328, 35).
; PLAN: r0=413(x1), r1=250(y1), r2=60(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=359(x), r6=161(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=328(x), r11=35(y), r12=103(width), r13=95(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 413
LDI r1, 250
LDI r2, 60
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 161
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 328
LDI r11, 35
LDI r12, 103
LDI r13, 95
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
