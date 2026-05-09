; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (183, 254) to (126, 10). Then Renders a white disk with center (50, 210) and radius 39.
; PLAN: r0=183(x1), r1=254(y1), r2=126(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=50(x), r1=210(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta line segment connecting (183, 254) to (126, 10).
; PLAN: r0=183(x1), r1=254(y1), r2=126(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 254
LDI r2, 126
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white disk with center (50, 210) and radius 39.
; PLAN: r0=50(x), r1=210(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 210
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
