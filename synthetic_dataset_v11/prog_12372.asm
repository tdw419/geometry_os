; DESCRIPTION: Composite: . Then Places a white line segment connecting (68, 64) to (157, 134). Then Renders a purple box of size 56x93 starting at (183, 122).
; PLAN: r0=68(x1), r1=64(y1), r2=157(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=183(x), r1=122(y), r2=56(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white line segment connecting (68, 64) to (157, 134).
; PLAN: r0=68(x1), r1=64(y1), r2=157(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 64
LDI r2, 157
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple box of size 56x93 starting at (183, 122).
; PLAN: r0=183(x), r1=122(y), r2=56(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 122
LDI r2, 56
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
