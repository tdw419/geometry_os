; DESCRIPTION: Renders a blue box of size 43x32 starting at (266, 152).
; PLAN: r0=266(x), r1=152(y), r2=43(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 152
LDI r2, 43
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
