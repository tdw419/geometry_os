; DESCRIPTION: Composite: Draws a magenta line from (351, 95) to (166, 184) then Renders a orange box of size 48x77 starting at (196, 153) then Places a magenta circle of radius 65 at center (368, 174).
; PLAN: r0=351(x1), r1=95(y1), r2=166(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=153(y), r7=48(width), r8=77(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=368(x), r11=174(y), r12=65(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 351
LDI r1, 95
LDI r2, 166
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 153
LDI r7, 48
LDI r8, 77
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 368
LDI r11, 174
LDI r12, 65
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
