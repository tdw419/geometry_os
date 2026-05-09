; DESCRIPTION: Creates a red rectangular region at (27, 63) spanning 103 by 78 pixels.
; PLAN: r0=27(x), r1=63(y), r2=103(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 63
LDI r2, 103
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
