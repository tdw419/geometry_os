; DESCRIPTION: Composite: Places a magenta 68x80 rectangle at position (87, 164) then Draws a blue line from (464, 108) to (210, 97).
; PLAN: r0=87(x), r1=164(y), r2=68(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=464(x1), r6=108(y1), r7=210(x2), r8=97(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 87
LDI r1, 164
LDI r2, 68
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 108
LDI r7, 210
LDI r8, 97
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
