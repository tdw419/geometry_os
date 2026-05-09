; DESCRIPTION: Creates a magenta rectangular region at (198, 143) spanning 21 by 15 pixels.
; PLAN: r0=198(x), r1=143(y), r2=21(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 143
LDI r2, 21
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
