; DESCRIPTION: Creates a purple rectangular region at (32, 103) spanning 36 by 64 pixels.
; PLAN: r0=32(x), r1=103(y), r2=36(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 103
LDI r2, 36
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
