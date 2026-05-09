; DESCRIPTION: Places a yellow 32x20 rectangle at position (129, 139).
; PLAN: r0=129(x), r1=139(y), r2=32(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 139
LDI r2, 32
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
