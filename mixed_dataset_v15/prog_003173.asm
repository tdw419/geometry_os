; DESCRIPTION: Renders a purple box of size 21x54 starting at (299, 178).
; PLAN: r0=299(x), r1=178(y), r2=21(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 178
LDI r2, 21
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
