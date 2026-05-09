; DESCRIPTION: Creates a magenta rectangular region at (45, 139) spanning 117 by 86 pixels.
; PLAN: r0=45(x), r1=139(y), r2=117(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 139
LDI r2, 117
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
