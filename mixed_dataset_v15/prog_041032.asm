; DESCRIPTION: Composite: Draws a white line from (366, 236) to (2, 58) then Renders a blue box of size 18x61 starting at (466, 159).
; PLAN: r0=366(x1), r1=236(y1), r2=2(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=159(y), r7=18(width), r8=61(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 236
LDI r2, 2
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 159
LDI r7, 18
LDI r8, 61
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
