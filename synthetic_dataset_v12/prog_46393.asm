; DESCRIPTION: Creates a orange rectangular region at (363, 178) spanning 75 by 27 pixels.
; PLAN: r0=363(x), r1=178(y), r2=75(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 178
LDI r2, 75
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
