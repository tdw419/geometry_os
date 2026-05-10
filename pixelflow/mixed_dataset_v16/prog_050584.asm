; DESCRIPTION: Renders a orange rectangular region spanning 70 by 77 at (193, 64).
; PLAN: r0=193(x), r1=64(y), r2=70(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 64
LDI r2, 70
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
