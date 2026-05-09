; DESCRIPTION: Creates a black rectangular region at (32, 82) spanning 32 by 48 pixels.
; PLAN: r0=32(x), r1=82(y), r2=32(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 82
LDI r2, 32
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
