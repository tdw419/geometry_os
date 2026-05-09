; DESCRIPTION: Creates a magenta rectangular region at (215, 63) spanning 36 by 45 pixels.
; PLAN: r0=215(x), r1=63(y), r2=36(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 63
LDI r2, 36
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
