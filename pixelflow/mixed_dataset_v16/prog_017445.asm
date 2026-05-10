; DESCRIPTION: Creates a magenta rectangular region at (400, 38) spanning 85 by 12 pixels.
; PLAN: r0=400(x), r1=38(y), r2=85(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 38
LDI r2, 85
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
