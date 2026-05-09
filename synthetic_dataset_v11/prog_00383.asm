; DESCRIPTION: Renders a purple box of size 54x70 starting at (165, 87).
; PLAN: r0=165(x), r1=87(y), r2=54(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 87
LDI r2, 54
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
