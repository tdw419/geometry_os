; DESCRIPTION: Places a black 62x99 rectangle at position (446, 53).
; PLAN: r0=446(x), r1=53(y), r2=62(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 53
LDI r2, 62
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
