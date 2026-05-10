; DESCRIPTION: Creates a cyan rectangular region at (154, 28) spanning 13 by 27 pixels.
; PLAN: r0=154(x), r1=28(y), r2=13(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 28
LDI r2, 13
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
