; DESCRIPTION: Renders a blue box of size 87x58 starting at (12, 187).
; PLAN: r0=12(x), r1=187(y), r2=87(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 187
LDI r2, 87
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
