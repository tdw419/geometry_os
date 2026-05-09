; DESCRIPTION: Creates a cyan rectangular region at (42, 201) spanning 113 by 34 pixels.
; PLAN: r0=42(x), r1=201(y), r2=113(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 201
LDI r2, 113
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
