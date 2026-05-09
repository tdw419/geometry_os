; DESCRIPTION: Creates a orange rectangular region at (309, 45) spanning 90 by 120 pixels.
; PLAN: r0=309(x), r1=45(y), r2=90(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 45
LDI r2, 90
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
