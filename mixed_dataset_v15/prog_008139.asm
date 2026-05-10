; DESCRIPTION: Creates a magenta rectangular region at (215, 33) spanning 24 by 21 pixels.
; PLAN: r0=215(x), r1=33(y), r2=24(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 33
LDI r2, 24
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
