; DESCRIPTION: Creates a orange rectangular region at (220, 153) spanning 107 by 48 pixels.
; PLAN: r0=220(x), r1=153(y), r2=107(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 153
LDI r2, 107
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
