; DESCRIPTION: Creates a purple filled rectangle of size 24x52 starting at (328, 63).
; PLAN: r0=328(x), r1=63(y), r2=24(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 63
LDI r2, 24
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
