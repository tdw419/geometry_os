; DESCRIPTION: Creates a orange rectangular region at (72, 160) spanning 32 by 80 pixels.
; PLAN: r0=72(x), r1=160(y), r2=32(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 160
LDI r2, 32
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
