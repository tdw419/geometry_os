; DESCRIPTION: Composite: Renders a magenta box of size 19x78 starting at (135, 124) then Draws a red line from (434, 138) to (356, 112).
; PLAN: r0=135(x), r1=124(y), r2=19(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x1), r6=138(y1), r7=356(x2), r8=112(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 135
LDI r1, 124
LDI r2, 19
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 138
LDI r7, 356
LDI r8, 112
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
