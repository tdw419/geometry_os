; DESCRIPTION: Creates a red rectangular region at (144, 29) spanning 92 by 32 pixels.
; PLAN: r0=144(x), r1=29(y), r2=92(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 29
LDI r2, 92
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
