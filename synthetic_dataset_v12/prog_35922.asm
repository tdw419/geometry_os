; DESCRIPTION: Composite: Places a cyan 104x113 rectangle at position (5, 82) then Sets a single red pixel at (17, 133) then Draws a red line from (125, 160) to (180, 96).
; PLAN: r0=5(x), r1=82(y), r2=104(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=17(x), r6=133(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=125(x1), r11=160(y1), r12=180(x2), r13=96(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 5
LDI r1, 82
LDI r2, 104
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 133
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 125
LDI r11, 160
LDI r12, 180
LDI r13, 96
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
