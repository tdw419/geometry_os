; DESCRIPTION: Renders a blue box of size 11x38 starting at (58, 215).
; PLAN: r0=58(x), r1=215(y), r2=11(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 215
LDI r2, 11
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
