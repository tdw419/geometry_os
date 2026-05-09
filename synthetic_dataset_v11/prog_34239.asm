; DESCRIPTION: Composite: . Then Draws a magenta line from (212, 180) to (46, 37). Then Draws a yellow rectangle at (224, 22) with width 19 and height 59.
; PLAN: r0=212(x1), r1=180(y1), r2=46(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=224(x), r1=22(y), r2=19(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta line from (212, 180) to (46, 37).
; PLAN: r0=212(x1), r1=180(y1), r2=46(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 180
LDI r2, 46
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow rectangle at (224, 22) with width 19 and height 59.
; PLAN: r0=224(x), r1=22(y), r2=19(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 22
LDI r2, 19
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
