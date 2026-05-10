; DESCRIPTION: Creates a magenta rectangular region at (415, 200) spanning 43 by 21 pixels.
; PLAN: r0=415(x), r1=200(y), r2=43(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 200
LDI r2, 43
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
