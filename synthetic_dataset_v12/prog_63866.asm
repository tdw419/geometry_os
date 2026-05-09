; DESCRIPTION: Creates a red rectangular region at (182, 54) spanning 32 by 21 pixels.
; PLAN: r0=182(x), r1=54(y), r2=32(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 54
LDI r2, 32
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
