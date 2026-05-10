; DESCRIPTION: Composite: Draws a green line from (411, 166) to (364, 149) then Places a black 65x22 rectangle at position (181, 221).
; PLAN: r0=411(x1), r1=166(y1), r2=364(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=181(x), r6=221(y), r7=65(width), r8=22(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 411
LDI r1, 166
LDI r2, 364
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 221
LDI r7, 65
LDI r8, 22
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
