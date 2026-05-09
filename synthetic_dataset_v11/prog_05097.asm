; DESCRIPTION: Composite: . Then Renders a orange box of size 15x56 starting at (203, 57). Then Draws a yellow line from (20, 153) to (186, 151).
; PLAN: r0=203(x), r1=57(y), r2=15(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=20(x1), r1=153(y1), r2=186(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange box of size 15x56 starting at (203, 57).
; PLAN: r0=203(x), r1=57(y), r2=15(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 57
LDI r2, 15
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow line from (20, 153) to (186, 151).
; PLAN: r0=20(x1), r1=153(y1), r2=186(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 153
LDI r2, 186
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
