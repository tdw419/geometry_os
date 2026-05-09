; DESCRIPTION: Creates a cyan rectangular region at (95, 83) spanning 69 by 87 pixels.
; PLAN: r0=95(x), r1=83(y), r2=69(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 83
LDI r2, 69
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
