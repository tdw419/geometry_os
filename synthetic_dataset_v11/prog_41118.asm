; DESCRIPTION: Creates a orange rectangular region at (46, 80) spanning 48 by 66 pixels.
; PLAN: r0=46(x), r1=80(y), r2=48(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 80
LDI r2, 48
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
