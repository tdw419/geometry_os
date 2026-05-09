; DESCRIPTION: Creates a white rectangular region at (392, 109) spanning 64 by 84 pixels.
; PLAN: r0=392(x), r1=109(y), r2=64(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 109
LDI r2, 64
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
