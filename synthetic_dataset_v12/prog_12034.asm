; DESCRIPTION: Creates a red rectangular region at (48, 15) spanning 73 by 64 pixels.
; PLAN: r0=48(x), r1=15(y), r2=73(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 15
LDI r2, 73
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
