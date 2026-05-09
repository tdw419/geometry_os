; DESCRIPTION: Creates a orange rectangular region at (18, 164) spanning 46 by 44 pixels.
; PLAN: r0=18(x), r1=164(y), r2=46(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 164
LDI r2, 46
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
