; DESCRIPTION: Composite: Draws a magenta line from (442, 181) to (43, 224) then Renders a orange box of size 46x65 starting at (209, 150).
; PLAN: r0=442(x1), r1=181(y1), r2=43(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=209(x), r6=150(y), r7=46(width), r8=65(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 442
LDI r1, 181
LDI r2, 43
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 150
LDI r7, 46
LDI r8, 65
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
