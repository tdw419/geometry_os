; DESCRIPTION: Composite: Draws a blue line from (196, 74) to (416, 15) then Places a magenta 91x16 rectangle at position (175, 73).
; PLAN: r0=196(x1), r1=74(y1), r2=416(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=73(y), r7=91(width), r8=16(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 196
LDI r1, 74
LDI r2, 416
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 73
LDI r7, 91
LDI r8, 16
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
