; DESCRIPTION: Places a black 19x84 rectangle at position (218, 55).
; PLAN: r0=218(x), r1=55(y), r2=19(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 55
LDI r2, 19
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
