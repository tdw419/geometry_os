; DESCRIPTION: Creates a orange rectangular region at (247, 59) spanning 29 by 51 pixels.
; PLAN: r0=247(x), r1=59(y), r2=29(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 59
LDI r2, 29
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
