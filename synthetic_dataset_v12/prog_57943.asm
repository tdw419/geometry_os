; DESCRIPTION: Creates a magenta rectangular region at (320, 45) spanning 20 by 57 pixels.
; PLAN: r0=320(x), r1=45(y), r2=20(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 45
LDI r2, 20
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
