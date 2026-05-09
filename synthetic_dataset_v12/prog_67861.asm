; DESCRIPTION: Renders a blue box of size 79x35 starting at (271, 192).
; PLAN: r0=271(x), r1=192(y), r2=79(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 192
LDI r2, 79
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
