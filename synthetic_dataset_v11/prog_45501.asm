; DESCRIPTION: Places a yellow 80x58 rectangle at position (109, 139).
; PLAN: r0=109(x), r1=139(y), r2=80(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 139
LDI r2, 80
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
