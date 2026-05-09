; DESCRIPTION: Creates a red rectangular region at (123, 20) spanning 63 by 28 pixels.
; PLAN: r0=123(x), r1=20(y), r2=63(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 20
LDI r2, 63
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
