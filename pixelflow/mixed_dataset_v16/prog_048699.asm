; DESCRIPTION: Places a black 22x47 rectangle at position (153, 139).
; PLAN: r0=153(x), r1=139(y), r2=22(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 139
LDI r2, 22
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
