; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (161, 101) to (67, 25). Then Renders a cyan box of size 11x93 starting at (237, 22).
; PLAN: r0=161(x1), r1=101(y1), r2=67(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=237(x), r1=22(y), r2=11(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta line segment connecting (161, 101) to (67, 25).
; PLAN: r0=161(x1), r1=101(y1), r2=67(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 101
LDI r2, 67
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan box of size 11x93 starting at (237, 22).
; PLAN: r0=237(x), r1=22(y), r2=11(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 22
LDI r2, 11
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
