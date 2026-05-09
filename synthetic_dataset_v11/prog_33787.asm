; DESCRIPTION: Creates a cyan rectangular region at (98, 65) spanning 42 by 109 pixels.
; PLAN: r0=98(x), r1=65(y), r2=42(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 65
LDI r2, 42
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
