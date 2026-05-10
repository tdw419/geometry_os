; DESCRIPTION: Creates a cyan rectangular region at (158, 124) spanning 42 by 114 pixels.
; PLAN: r0=158(x), r1=124(y), r2=42(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 124
LDI r2, 42
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
