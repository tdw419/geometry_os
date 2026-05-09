; DESCRIPTION: Creates a cyan rectangular region at (87, 143) spanning 116 by 68 pixels.
; PLAN: r0=87(x), r1=143(y), r2=116(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 143
LDI r2, 116
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
