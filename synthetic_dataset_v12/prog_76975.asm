; DESCRIPTION: Creates a orange rectangular region at (330, 24) spanning 107 by 60 pixels.
; PLAN: r0=330(x), r1=24(y), r2=107(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 24
LDI r2, 107
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
