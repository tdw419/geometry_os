; DESCRIPTION: Creates a magenta rectangular region at (249, 50) spanning 90 by 68 pixels.
; PLAN: r0=249(x), r1=50(y), r2=90(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 50
LDI r2, 90
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
