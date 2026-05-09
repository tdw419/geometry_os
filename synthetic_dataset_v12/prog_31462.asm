; DESCRIPTION: Composite: Draws a magenta line from (223, 205) to (155, 47) then Places a red 39x106 rectangle at position (71, 20).
; PLAN: r0=223(x1), r1=205(y1), r2=155(x2), r3=47(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=20(y), r7=39(width), r8=106(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 223
LDI r1, 205
LDI r2, 155
LDI r3, 47
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 20
LDI r7, 39
LDI r8, 106
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
