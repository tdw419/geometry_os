; DESCRIPTION: Creates a orange rectangular region at (72, 50) spanning 89 by 72 pixels.
; PLAN: r0=72(x), r1=50(y), r2=89(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 50
LDI r2, 89
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
