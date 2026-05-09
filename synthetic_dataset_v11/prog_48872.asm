; DESCRIPTION: Creates a cyan rectangular region at (7, 50) spanning 13 by 76 pixels.
; PLAN: r0=7(x), r1=50(y), r2=13(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 50
LDI r2, 13
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
