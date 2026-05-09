; DESCRIPTION: Places a yellow 99x82 rectangle at position (88, 128).
; PLAN: r0=88(x), r1=128(y), r2=99(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 128
LDI r2, 99
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
