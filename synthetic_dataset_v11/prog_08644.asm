; DESCRIPTION: Places a black 43x99 rectangle at position (162, 139).
; PLAN: r0=162(x), r1=139(y), r2=43(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 139
LDI r2, 43
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
