; DESCRIPTION: Creates a orange rectangular region at (440, 10) spanning 64 by 15 pixels.
; PLAN: r0=440(x), r1=10(y), r2=64(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 10
LDI r2, 64
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
