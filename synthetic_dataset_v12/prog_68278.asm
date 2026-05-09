; DESCRIPTION: Creates a cyan rectangular region at (174, 42) spanning 81 by 114 pixels.
; PLAN: r0=174(x), r1=42(y), r2=81(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 42
LDI r2, 81
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
