; DESCRIPTION: Creates a cyan rectangular region at (68, 154) spanning 65 by 78 pixels.
; PLAN: r0=68(x), r1=154(y), r2=65(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 154
LDI r2, 65
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
