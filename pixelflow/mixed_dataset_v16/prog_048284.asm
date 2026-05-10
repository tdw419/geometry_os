; DESCRIPTION: Composite: Draws a red line from (120, 126) to (436, 121) then Places a cyan 110x25 rectangle at position (236, 118) then Places a cyan circle of radius 53 at center (171, 104).
; PLAN: r0=120(x1), r1=126(y1), r2=436(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=236(x), r6=118(y), r7=110(width), r8=25(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=171(x), r11=104(y), r12=53(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 120
LDI r1, 126
LDI r2, 436
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 118
LDI r7, 110
LDI r8, 25
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 104
LDI r12, 53
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
