; DESCRIPTION: Creates a orange rectangular region at (281, 106) spanning 54 by 90 pixels.
; PLAN: r0=281(x), r1=106(y), r2=54(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 106
LDI r2, 54
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
