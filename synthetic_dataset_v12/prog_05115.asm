; DESCRIPTION: Composite: Draws a magenta line from (429, 206) to (188, 151) then Renders a magenta box of size 84x21 starting at (371, 25) then Places a magenta circle of radius 66 at center (103, 75).
; PLAN: r0=429(x1), r1=206(y1), r2=188(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=371(x), r6=25(y), r7=84(width), r8=21(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=103(x), r11=75(y), r12=66(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 429
LDI r1, 206
LDI r2, 188
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 25
LDI r7, 84
LDI r8, 21
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 75
LDI r12, 66
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
