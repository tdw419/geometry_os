; DESCRIPTION: Creates a orange rectangular region at (131, 63) spanning 22 by 120 pixels.
; PLAN: r0=131(x), r1=63(y), r2=22(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 63
LDI r2, 22
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
