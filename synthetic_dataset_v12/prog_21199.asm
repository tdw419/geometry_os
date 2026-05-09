; DESCRIPTION: Creates a magenta rectangular region at (215, 150) spanning 97 by 57 pixels.
; PLAN: r0=215(x), r1=150(y), r2=97(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 150
LDI r2, 97
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
