; DESCRIPTION: Places a black 28x22 rectangle at position (200, 59).
; PLAN: r0=200(x), r1=59(y), r2=28(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 59
LDI r2, 28
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
