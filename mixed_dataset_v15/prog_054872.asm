; DESCRIPTION: Composite: Draws a magenta line from (181, 73) to (174, 47) then Renders a magenta box of size 105x37 starting at (228, 108).
; PLAN: r0=181(x1), r1=73(y1), r2=174(x2), r3=47(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=228(x), r6=108(y), r7=105(width), r8=37(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 181
LDI r1, 73
LDI r2, 174
LDI r3, 47
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 108
LDI r7, 105
LDI r8, 37
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
