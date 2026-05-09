; DESCRIPTION: Creates a orange rectangular region at (72, 127) spanning 79 by 24 pixels.
; PLAN: r0=72(x), r1=127(y), r2=79(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 127
LDI r2, 79
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
