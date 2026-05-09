; DESCRIPTION: Creates a red rectangular region at (236, 64) spanning 57 by 115 pixels.
; PLAN: r0=236(x), r1=64(y), r2=57(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 64
LDI r2, 57
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
