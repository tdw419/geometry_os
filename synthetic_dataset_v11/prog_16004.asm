; DESCRIPTION: Creates a orange rectangular region at (180, 89) spanning 25 by 11 pixels.
; PLAN: r0=180(x), r1=89(y), r2=25(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 89
LDI r2, 25
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
