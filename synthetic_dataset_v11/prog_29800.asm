; DESCRIPTION: Creates a orange rectangular region at (128, 174) spanning 95 by 80 pixels.
; PLAN: r0=128(x), r1=174(y), r2=95(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 174
LDI r2, 95
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
