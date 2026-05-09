; DESCRIPTION: Creates a orange rectangular region at (403, 119) spanning 48 by 107 pixels.
; PLAN: r0=403(x), r1=119(y), r2=48(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 119
LDI r2, 48
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
