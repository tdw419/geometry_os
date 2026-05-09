; DESCRIPTION: Renders a purple box of size 46x48 starting at (128, 15).
; PLAN: r0=128(x), r1=15(y), r2=46(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 15
LDI r2, 46
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
