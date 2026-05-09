; DESCRIPTION: Creates a orange rectangular region at (71, 168) spanning 71 by 75 pixels.
; PLAN: r0=71(x), r1=168(y), r2=71(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 168
LDI r2, 71
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
