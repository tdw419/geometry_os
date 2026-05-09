; DESCRIPTION: Creates a orange rectangular region at (445, 119) spanning 36 by 120 pixels.
; PLAN: r0=445(x), r1=119(y), r2=36(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 119
LDI r2, 36
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
