; DESCRIPTION: Renders a blue box of size 32x87 starting at (243, 36).
; PLAN: r0=243(x), r1=36(y), r2=32(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 36
LDI r2, 32
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
