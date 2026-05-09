; DESCRIPTION: Composite: Draws a red line from (447, 150) to (139, 124) then Places a blue dot at position (100, 73) then Renders a red box of size 117x107 starting at (29, 108).
; PLAN: r0=447(x1), r1=150(y1), r2=139(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=100(x), r6=73(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=29(x), r11=108(y), r12=117(width), r13=107(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 447
LDI r1, 150
LDI r2, 139
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 73
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 29
LDI r11, 108
LDI r12, 117
LDI r13, 107
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
