; DESCRIPTION: Creates a red rectangular region at (246, 9) spanning 79 by 87 pixels.
; PLAN: r0=246(x), r1=9(y), r2=79(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 9
LDI r2, 79
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
