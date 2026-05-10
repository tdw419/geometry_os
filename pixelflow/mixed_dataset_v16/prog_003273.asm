; DESCRIPTION: Renders a purple box of size 68x116 starting at (192, 16).
; PLAN: r0=192(x), r1=16(y), r2=68(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 16
LDI r2, 68
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
