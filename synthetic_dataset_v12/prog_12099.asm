; DESCRIPTION: Creates a magenta rectangular region at (268, 35) spanning 42 by 117 pixels.
; PLAN: r0=268(x), r1=35(y), r2=42(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 35
LDI r2, 42
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
