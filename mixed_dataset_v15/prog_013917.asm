; DESCRIPTION: Creates a magenta rectangular region at (214, 172) spanning 58 by 68 pixels.
; PLAN: r0=214(x), r1=172(y), r2=58(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 172
LDI r2, 58
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
