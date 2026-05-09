; DESCRIPTION: Composite: . Then Places a orange circle of radius 10 at center (211, 13). Then Renders a purple box of size 52x21 starting at (69, 173).
; PLAN: r0=211(x), r1=13(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=69(x), r1=173(y), r2=52(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange circle of radius 10 at center (211, 13).
; PLAN: r0=211(x), r1=13(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 13
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple box of size 52x21 starting at (69, 173).
; PLAN: r0=69(x), r1=173(y), r2=52(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 173
LDI r2, 52
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
