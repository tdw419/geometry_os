; DESCRIPTION: Creates a cyan rectangular region at (10, 154) spanning 28 by 15 pixels.
; PLAN: r0=10(x), r1=154(y), r2=28(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 154
LDI r2, 28
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
