; DESCRIPTION: Renders a orange rectangular region spanning 97 by 77 at (305, 105).
; PLAN: r0=305(x), r1=105(y), r2=97(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 105
LDI r2, 97
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
