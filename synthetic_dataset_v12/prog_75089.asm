; DESCRIPTION: Creates a cyan rectangular region at (42, 30) spanning 117 by 101 pixels.
; PLAN: r0=42(x), r1=30(y), r2=117(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 30
LDI r2, 117
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
