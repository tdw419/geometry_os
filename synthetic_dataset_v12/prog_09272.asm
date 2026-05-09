; DESCRIPTION: Creates a orange rectangular region at (92, 73) spanning 94 by 99 pixels.
; PLAN: r0=92(x), r1=73(y), r2=94(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 73
LDI r2, 94
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
