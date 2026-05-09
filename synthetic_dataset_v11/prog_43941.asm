; DESCRIPTION: Creates a magenta rectangular region at (176, 213) spanning 62 by 27 pixels.
; PLAN: r0=176(x), r1=213(y), r2=62(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 213
LDI r2, 62
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
