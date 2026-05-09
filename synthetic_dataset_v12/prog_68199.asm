; DESCRIPTION: Composite: Places a blue 73x116 rectangle at position (158, 21) then Draws a red line from (480, 120) to (273, 206).
; PLAN: r0=158(x), r1=21(y), r2=73(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=480(x1), r6=120(y1), r7=273(x2), r8=206(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 158
LDI r1, 21
LDI r2, 73
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 120
LDI r7, 273
LDI r8, 206
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
