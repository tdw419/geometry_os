; DESCRIPTION: Composite: Draws a black rectangle at (174, 50) with width 10 and height 85 then Places a blue line segment connecting (420, 32) to (362, 15).
; PLAN: r0=174(x), r1=50(y), r2=10(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=420(x1), r6=32(y1), r7=362(x2), r8=15(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 174
LDI r1, 50
LDI r2, 10
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 32
LDI r7, 362
LDI r8, 15
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
