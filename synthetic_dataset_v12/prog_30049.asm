; DESCRIPTION: Renders a purple box of size 70x16 starting at (312, 91).
; PLAN: r0=312(x), r1=91(y), r2=70(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 91
LDI r2, 70
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
