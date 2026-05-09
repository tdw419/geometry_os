; DESCRIPTION: Creates a magenta rectangular region at (126, 21) spanning 33 by 59 pixels.
; PLAN: r0=126(x), r1=21(y), r2=33(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 21
LDI r2, 33
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
