; DESCRIPTION: Composite: Sets a single black pixel at (459, 161) then Places a black 108x50 rectangle at position (397, 21) then Draws a purple line from (336, 82) to (362, 135).
; PLAN: r0=459(x), r1=161(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=397(x), r6=21(y), r7=108(width), r8=50(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=336(x1), r11=82(y1), r12=362(x2), r13=135(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 459
LDI r1, 161
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 397
LDI r6, 21
LDI r7, 108
LDI r8, 50
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 336
LDI r11, 82
LDI r12, 362
LDI r13, 135
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
