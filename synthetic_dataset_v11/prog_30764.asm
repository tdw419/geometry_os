; DESCRIPTION: Composite: . Then Renders a magenta box of size 47x99 starting at (183, 52). Then Places a green circle of radius 32 at center (85, 110).
; PLAN: r0=183(x), r1=52(y), r2=47(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=85(x), r1=110(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta box of size 47x99 starting at (183, 52).
; PLAN: r0=183(x), r1=52(y), r2=47(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 52
LDI r2, 47
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 32 at center (85, 110).
; PLAN: r0=85(x), r1=110(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 110
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
