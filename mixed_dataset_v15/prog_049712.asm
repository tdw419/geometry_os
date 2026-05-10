; DESCRIPTION: Creates a orange rectangular region at (3, 223) spanning 117 by 19 pixels.
; PLAN: r0=3(x), r1=223(y), r2=117(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 223
LDI r2, 117
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
