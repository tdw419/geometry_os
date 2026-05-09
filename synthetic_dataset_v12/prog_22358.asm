; DESCRIPTION: Creates a cyan rectangular region at (44, 96) spanning 44 by 95 pixels.
; PLAN: r0=44(x), r1=96(y), r2=44(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 96
LDI r2, 44
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
