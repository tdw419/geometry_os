; DESCRIPTION: Creates a red rectangular region at (83, 85) spanning 27 by 77 pixels.
; PLAN: r0=83(x), r1=85(y), r2=27(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 85
LDI r2, 27
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
