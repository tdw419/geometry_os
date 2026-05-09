; DESCRIPTION: Creates a cyan rectangular region at (335, 10) spanning 103 by 58 pixels.
; PLAN: r0=335(x), r1=10(y), r2=103(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 10
LDI r2, 103
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
