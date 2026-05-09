; DESCRIPTION: Creates a cyan rectangular region at (78, 4) spanning 45 by 103 pixels.
; PLAN: r0=78(x), r1=4(y), r2=45(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 4
LDI r2, 45
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
