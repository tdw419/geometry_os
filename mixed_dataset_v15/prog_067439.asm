; DESCRIPTION: Places a black 55x100 rectangle at position (244, 3).
; PLAN: r0=244(x), r1=3(y), r2=55(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 3
LDI r2, 55
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
