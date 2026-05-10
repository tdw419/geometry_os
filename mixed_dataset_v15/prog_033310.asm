; DESCRIPTION: Creates a purple filled rectangle of size 104x36 starting at (16, 83).
; PLAN: r0=16(x), r1=83(y), r2=104(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 83
LDI r2, 104
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
