; DESCRIPTION: Creates a cyan rectangular region at (68, 116) spanning 65 by 34 pixels.
; PLAN: r0=68(x), r1=116(y), r2=65(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 116
LDI r2, 65
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
