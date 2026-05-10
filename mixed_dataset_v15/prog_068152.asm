; DESCRIPTION: Composite: Draws a black line from (437, 145) to (510, 245) then Renders a magenta box of size 117x75 starting at (206, 12).
; PLAN: r0=437(x1), r1=145(y1), r2=510(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=206(x), r6=12(y), r7=117(width), r8=75(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 437
LDI r1, 145
LDI r2, 510
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 12
LDI r7, 117
LDI r8, 75
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
