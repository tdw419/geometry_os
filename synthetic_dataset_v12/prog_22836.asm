; DESCRIPTION: Creates a yellow rectangular region at (42, 27) spanning 113 by 96 pixels.
; PLAN: r0=42(x), r1=27(y), r2=113(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 27
LDI r2, 113
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
