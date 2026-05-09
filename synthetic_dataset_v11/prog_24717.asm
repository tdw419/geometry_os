; DESCRIPTION: Composite: . Then Places a black line segment connecting (245, 30) to (222, 5). Then Renders a green box of size 28x113 starting at (124, 50).
; PLAN: r0=245(x1), r1=30(y1), r2=222(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=124(x), r1=50(y), r2=28(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black line segment connecting (245, 30) to (222, 5).
; PLAN: r0=245(x1), r1=30(y1), r2=222(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 30
LDI r2, 222
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green box of size 28x113 starting at (124, 50).
; PLAN: r0=124(x), r1=50(y), r2=28(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 50
LDI r2, 28
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
