; DESCRIPTION: Creates a orange rectangular region at (323, 30) spanning 98 by 120 pixels.
; PLAN: r0=323(x), r1=30(y), r2=98(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 30
LDI r2, 98
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
