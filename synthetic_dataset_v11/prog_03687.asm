; DESCRIPTION: Creates a red rectangular region at (216, 128) spanning 38 by 63 pixels.
; PLAN: r0=216(x), r1=128(y), r2=38(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 128
LDI r2, 38
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
