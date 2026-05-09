; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (123, 6) spanning 97 by 102 pixels. Then Renders a magenta line between points (28, 14) and (119, 196).
; PLAN: r0=123(x), r1=6(y), r2=97(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=28(x1), r1=14(y1), r2=119(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange rectangular region at (123, 6) spanning 97 by 102 pixels.
; PLAN: r0=123(x), r1=6(y), r2=97(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 6
LDI r2, 97
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta line between points (28, 14) and (119, 196).
; PLAN: r0=28(x1), r1=14(y1), r2=119(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 14
LDI r2, 119
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
