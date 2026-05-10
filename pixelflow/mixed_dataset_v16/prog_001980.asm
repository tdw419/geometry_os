; DESCRIPTION: Composite: Places a magenta circle of radius 16 at center (183, 133) then Draws a red line from (319, 195) to (246, 212).
; PLAN: r0=183(x), r1=133(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=319(x1), r6=195(y1), r7=246(x2), r8=212(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 183
LDI r1, 133
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 319
LDI r6, 195
LDI r7, 246
LDI r8, 212
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
