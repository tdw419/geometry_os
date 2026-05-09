; DESCRIPTION: Creates a red rectangular region at (57, 101) spanning 63 by 27 pixels.
; PLAN: r0=57(x), r1=101(y), r2=63(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 101
LDI r2, 63
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
