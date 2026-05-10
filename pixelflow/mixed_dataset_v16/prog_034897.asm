; DESCRIPTION: Creates a orange rectangular region at (410, 90) spanning 52 by 77 pixels.
; PLAN: r0=410(x), r1=90(y), r2=52(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 90
LDI r2, 52
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
