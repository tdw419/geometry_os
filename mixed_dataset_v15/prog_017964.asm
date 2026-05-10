; DESCRIPTION: Creates a black rectangular region at (219, 89) spanning 57 by 27 pixels.
; PLAN: r0=219(x), r1=89(y), r2=57(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 89
LDI r2, 57
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
