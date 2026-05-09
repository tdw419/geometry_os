; DESCRIPTION: Creates a red rectangular region at (217, 149) spanning 87 by 60 pixels.
; PLAN: r0=217(x), r1=149(y), r2=87(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 149
LDI r2, 87
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
