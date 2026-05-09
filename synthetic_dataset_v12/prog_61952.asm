; DESCRIPTION: Composite: Draws a blue line from (408, 195) to (68, 144) then Places a yellow 89x17 rectangle at position (415, 162).
; PLAN: r0=408(x1), r1=195(y1), r2=68(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=415(x), r6=162(y), r7=89(width), r8=17(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 408
LDI r1, 195
LDI r2, 68
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 162
LDI r7, 89
LDI r8, 17
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
