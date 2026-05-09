; DESCRIPTION: Creates a red rectangular region at (79, 179) spanning 86 by 47 pixels.
; PLAN: r0=79(x), r1=179(y), r2=86(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 179
LDI r2, 86
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
