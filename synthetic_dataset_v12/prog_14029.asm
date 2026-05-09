; DESCRIPTION: Creates a orange rectangular region at (267, 113) spanning 100 by 120 pixels.
; PLAN: r0=267(x), r1=113(y), r2=100(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 113
LDI r2, 100
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
