; DESCRIPTION: Creates a cyan rectangular region at (154, 109) spanning 37 by 84 pixels.
; PLAN: r0=154(x), r1=109(y), r2=37(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 109
LDI r2, 37
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
