; DESCRIPTION: Renders a blue box of size 96x66 starting at (243, 61).
; PLAN: r0=243(x), r1=61(y), r2=96(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 61
LDI r2, 96
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
