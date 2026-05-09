; DESCRIPTION: Creates a cyan rectangular region at (200, 42) spanning 118 by 109 pixels.
; PLAN: r0=200(x), r1=42(y), r2=118(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 42
LDI r2, 118
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
