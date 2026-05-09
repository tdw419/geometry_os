; DESCRIPTION: Composite: Draws a purple line from (186, 233) to (352, 181) then Creates a red rectangular region at (180, 32) spanning 42 by 50 pixels then Places a red dot at position (454, 67).
; PLAN: r0=186(x1), r1=233(y1), r2=352(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=180(x), r6=32(y), r7=42(width), r8=50(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=454(x), r11=67(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 186
LDI r1, 233
LDI r2, 352
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 32
LDI r7, 42
LDI r8, 50
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 454
LDI r11, 67
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
