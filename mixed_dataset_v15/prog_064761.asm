; DESCRIPTION: Creates a orange rectangular region at (302, 27) spanning 10 by 30 pixels.
; PLAN: r0=302(x), r1=27(y), r2=10(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 27
LDI r2, 10
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
