; DESCRIPTION: Composite: Draws a blue line from (355, 159) to (434, 132) then Places a blue 63x10 rectangle at position (327, 84).
; PLAN: r0=355(x1), r1=159(y1), r2=434(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=84(y), r7=63(width), r8=10(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 355
LDI r1, 159
LDI r2, 434
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 84
LDI r7, 63
LDI r8, 10
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
