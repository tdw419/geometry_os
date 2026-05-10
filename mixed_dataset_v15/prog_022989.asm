; DESCRIPTION: Creates a orange rectangular region at (400, 70) spanning 81 by 64 pixels.
; PLAN: r0=400(x), r1=70(y), r2=81(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 70
LDI r2, 81
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
