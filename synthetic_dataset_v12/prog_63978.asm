; DESCRIPTION: Renders a purple box of size 61x70 starting at (54, 76).
; PLAN: r0=54(x), r1=76(y), r2=61(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 76
LDI r2, 61
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
