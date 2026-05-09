; DESCRIPTION: Composite: . Then Draws a magenta line from (41, 192) to (152, 100). Then Renders a blue box of size 24x100 starting at (46, 56).
; PLAN: r0=41(x1), r1=192(y1), r2=152(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=46(x), r1=56(y), r2=24(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta line from (41, 192) to (152, 100).
; PLAN: r0=41(x1), r1=192(y1), r2=152(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 192
LDI r2, 152
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue box of size 24x100 starting at (46, 56).
; PLAN: r0=46(x), r1=56(y), r2=24(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 56
LDI r2, 24
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
