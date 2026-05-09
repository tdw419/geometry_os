; DESCRIPTION: Creates a black rectangular region at (168, 64) spanning 40 by 48 pixels.
; PLAN: r0=168(x), r1=64(y), r2=40(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 64
LDI r2, 40
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
