; DESCRIPTION: Composite: . Then Renders a red box of size 56x40 starting at (64, 131). Then Draws a purple line from (227, 244) to (11, 122).
; PLAN: r0=64(x), r1=131(y), r2=56(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=227(x1), r1=244(y1), r2=11(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red box of size 56x40 starting at (64, 131).
; PLAN: r0=64(x), r1=131(y), r2=56(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 131
LDI r2, 56
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple line from (227, 244) to (11, 122).
; PLAN: r0=227(x1), r1=244(y1), r2=11(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 244
LDI r2, 11
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
