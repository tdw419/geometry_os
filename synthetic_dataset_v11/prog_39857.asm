; DESCRIPTION: Creates a orange rectangular region at (24, 164) spanning 70 by 51 pixels.
; PLAN: r0=24(x), r1=164(y), r2=70(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 164
LDI r2, 70
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
