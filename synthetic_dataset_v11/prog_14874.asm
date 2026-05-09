; DESCRIPTION: Places a yellow 77x53 rectangle at position (108, 128).
; PLAN: r0=108(x), r1=128(y), r2=77(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 128
LDI r2, 77
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
