; DESCRIPTION: Renders a blue box of size 90x46 starting at (193, 128).
; PLAN: r0=193(x), r1=128(y), r2=90(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 128
LDI r2, 90
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
