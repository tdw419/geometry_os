; DESCRIPTION: Creates a cyan rectangular region at (300, 42) spanning 25 by 106 pixels.
; PLAN: r0=300(x), r1=42(y), r2=25(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 42
LDI r2, 25
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
