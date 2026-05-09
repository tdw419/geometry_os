; DESCRIPTION: Composite: Draws a white line from (260, 173) to (294, 35) then Renders a magenta box of size 43x119 starting at (79, 118).
; PLAN: r0=260(x1), r1=173(y1), r2=294(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=79(x), r6=118(y), r7=43(width), r8=119(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 173
LDI r2, 294
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 118
LDI r7, 43
LDI r8, 119
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
