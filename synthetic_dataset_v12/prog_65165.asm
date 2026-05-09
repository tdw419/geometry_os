; DESCRIPTION: Creates a orange rectangular region at (220, 113) spanning 94 by 80 pixels.
; PLAN: r0=220(x), r1=113(y), r2=94(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 113
LDI r2, 94
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
