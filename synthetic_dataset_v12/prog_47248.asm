; DESCRIPTION: Composite: Draws a magenta line from (29, 135) to (401, 180) then Places a purple dot at position (54, 241) then Places a magenta 32x117 rectangle at position (89, 47).
; PLAN: r0=29(x1), r1=135(y1), r2=401(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=54(x), r6=241(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=89(x), r11=47(y), r12=32(width), r13=117(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 29
LDI r1, 135
LDI r2, 401
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 241
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 89
LDI r11, 47
LDI r12, 32
LDI r13, 117
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
