; DESCRIPTION: Places a white 22x24 rectangle at position (129, 139).
; PLAN: r0=129(x), r1=139(y), r2=22(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 139
LDI r2, 22
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
