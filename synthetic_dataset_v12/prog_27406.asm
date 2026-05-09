; DESCRIPTION: Composite: Renders a magenta box of size 72x99 starting at (87, 57) then Draws a black line from (157, 102) to (164, 52).
; PLAN: r0=87(x), r1=57(y), r2=72(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=157(x1), r6=102(y1), r7=164(x2), r8=52(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 87
LDI r1, 57
LDI r2, 72
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 102
LDI r7, 164
LDI r8, 52
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
