; DESCRIPTION: Composite: . Then Renders a magenta box of size 13x38 starting at (87, 118). Then Places a purple circle of radius 33 at center (112, 133).
; PLAN: r0=87(x), r1=118(y), r2=13(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=112(x), r1=133(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta box of size 13x38 starting at (87, 118).
; PLAN: r0=87(x), r1=118(y), r2=13(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 118
LDI r2, 13
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 33 at center (112, 133).
; PLAN: r0=112(x), r1=133(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 133
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
