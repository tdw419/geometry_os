; DESCRIPTION: Creates a purple diamond shape using 4 lines meeting at the center.
; PLAN: r0=42(x), r1=4(y), r2=24(width), r3=1(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 4
LDI r2, 24
LDI r3, 1
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
