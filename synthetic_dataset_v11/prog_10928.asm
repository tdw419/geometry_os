; DESCRIPTION: Places a black 99x55 rectangle at position (54, 36).
; PLAN: r0=54(x), r1=36(y), r2=99(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 36
LDI r2, 99
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
