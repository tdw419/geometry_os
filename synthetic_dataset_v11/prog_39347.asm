; DESCRIPTION: Renders a purple box of size 13x31 starting at (86, 103).
; PLAN: r0=86(x), r1=103(y), r2=13(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 103
LDI r2, 13
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
