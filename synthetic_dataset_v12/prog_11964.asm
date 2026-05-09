; DESCRIPTION: Creates a red rectangular region at (295, 137) spanning 66 by 60 pixels.
; PLAN: r0=295(x), r1=137(y), r2=66(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 137
LDI r2, 66
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
