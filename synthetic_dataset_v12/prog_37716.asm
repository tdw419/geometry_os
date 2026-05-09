; DESCRIPTION: Creates a orange rectangular region at (98, 47) spanning 70 by 90 pixels.
; PLAN: r0=98(x), r1=47(y), r2=70(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 47
LDI r2, 70
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
