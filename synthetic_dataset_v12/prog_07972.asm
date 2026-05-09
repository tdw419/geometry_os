; DESCRIPTION: Creates a orange rectangular region at (175, 131) spanning 92 by 23 pixels.
; PLAN: r0=175(x), r1=131(y), r2=92(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 131
LDI r2, 92
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
