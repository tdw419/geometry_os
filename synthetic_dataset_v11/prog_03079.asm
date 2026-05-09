; DESCRIPTION: Composite: . Then Places a purple line segment connecting (221, 67) to (214, 54). Then Renders a purple box of size 32x81 starting at (199, 6).
; PLAN: r0=221(x1), r1=67(y1), r2=214(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=199(x), r1=6(y), r2=32(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple line segment connecting (221, 67) to (214, 54).
; PLAN: r0=221(x1), r1=67(y1), r2=214(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 67
LDI r2, 214
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple box of size 32x81 starting at (199, 6).
; PLAN: r0=199(x), r1=6(y), r2=32(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 6
LDI r2, 32
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
