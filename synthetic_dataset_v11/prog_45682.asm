; DESCRIPTION: Creates a orange rectangular region at (170, 10) spanning 51 by 113 pixels.
; PLAN: r0=170(x), r1=10(y), r2=51(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 10
LDI r2, 51
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
