; DESCRIPTION: Creates a purple filled rectangle of size 10x23 starting at (5, 113).
; PLAN: r0=5(x), r1=113(y), r2=10(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 113
LDI r2, 10
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
