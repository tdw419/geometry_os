; DESCRIPTION: Creates a magenta rectangular region at (326, 214) spanning 86 by 33 pixels.
; PLAN: r0=326(x), r1=214(y), r2=86(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 214
LDI r2, 86
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
