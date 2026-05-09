; DESCRIPTION: Creates a cyan rectangular region at (154, 123) spanning 29 by 16 pixels.
; PLAN: r0=154(x), r1=123(y), r2=29(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 123
LDI r2, 29
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
