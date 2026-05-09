; DESCRIPTION: Renders a blue box of size 34x85 starting at (21, 19).
; PLAN: r0=21(x), r1=19(y), r2=34(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 19
LDI r2, 34
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
