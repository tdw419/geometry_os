; DESCRIPTION: Creates a red rectangular region at (57, 27) spanning 66 by 96 pixels.
; PLAN: r0=57(x), r1=27(y), r2=66(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 27
LDI r2, 66
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
