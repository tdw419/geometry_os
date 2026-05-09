; DESCRIPTION: Creates a red rectangular region at (263, 96) spanning 92 by 74 pixels.
; PLAN: r0=263(x), r1=96(y), r2=92(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 96
LDI r2, 92
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
