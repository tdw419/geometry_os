; DESCRIPTION: Creates a magenta rectangular region at (184, 2) spanning 120 by 120 pixels.
; PLAN: r0=184(x), r1=2(y), r2=120(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 2
LDI r2, 120
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
