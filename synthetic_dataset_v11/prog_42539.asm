; DESCRIPTION: Places a black 28x11 rectangle at position (0, 219).
; PLAN: r0=0(x), r1=219(y), r2=28(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 219
LDI r2, 28
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
