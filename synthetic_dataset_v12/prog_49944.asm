; DESCRIPTION: Creates a orange rectangular region at (169, 125) spanning 74 by 10 pixels.
; PLAN: r0=169(x), r1=125(y), r2=74(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 125
LDI r2, 74
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
