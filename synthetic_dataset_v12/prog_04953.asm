; DESCRIPTION: Creates a orange rectangular region at (295, 145) spanning 45 by 63 pixels.
; PLAN: r0=295(x), r1=145(y), r2=45(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 145
LDI r2, 45
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
