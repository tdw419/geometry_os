; DESCRIPTION: Creates a black rectangular region at (464, 10) spanning 32 by 92 pixels.
; PLAN: r0=464(x), r1=10(y), r2=32(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 10
LDI r2, 32
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
