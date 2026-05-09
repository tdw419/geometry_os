; DESCRIPTION: Renders a purple box of size 21x68 starting at (32, 24).
; PLAN: r0=32(x), r1=24(y), r2=21(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 24
LDI r2, 21
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
