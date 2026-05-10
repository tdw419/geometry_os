; DESCRIPTION: Creates a red rectangular region at (144, 146) spanning 87 by 49 pixels.
; PLAN: r0=144(x), r1=146(y), r2=87(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 146
LDI r2, 87
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
