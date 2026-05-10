; DESCRIPTION: Composite: Renders a orange box of size 46x111 starting at (236, 39) then Draws a blue line from (343, 235) to (11, 180).
; PLAN: r0=236(x), r1=39(y), r2=46(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=343(x1), r6=235(y1), r7=11(x2), r8=180(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 39
LDI r2, 46
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 235
LDI r7, 11
LDI r8, 180
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
