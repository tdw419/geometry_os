; DESCRIPTION: Composite: . Then Renders a red box of size 49x50 starting at (150, 138). Then Places a magenta line segment connecting (232, 79) to (16, 124).
; PLAN: r0=150(x), r1=138(y), r2=49(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=232(x1), r1=79(y1), r2=16(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red box of size 49x50 starting at (150, 138).
; PLAN: r0=150(x), r1=138(y), r2=49(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 138
LDI r2, 49
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta line segment connecting (232, 79) to (16, 124).
; PLAN: r0=232(x1), r1=79(y1), r2=16(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 79
LDI r2, 16
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
