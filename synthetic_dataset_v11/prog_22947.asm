; DESCRIPTION: Renders a purple box of size 113x87 starting at (13, 102).
; PLAN: r0=13(x), r1=102(y), r2=113(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 102
LDI r2, 113
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
