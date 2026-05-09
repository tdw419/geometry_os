; DESCRIPTION: Creates a cyan rectangular region at (163, 42) spanning 34 by 90 pixels.
; PLAN: r0=163(x), r1=42(y), r2=34(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 42
LDI r2, 34
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
