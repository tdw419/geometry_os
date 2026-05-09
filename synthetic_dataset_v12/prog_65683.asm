; DESCRIPTION: Places a black 65x44 rectangle at position (141, 139).
; PLAN: r0=141(x), r1=139(y), r2=65(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 139
LDI r2, 65
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
