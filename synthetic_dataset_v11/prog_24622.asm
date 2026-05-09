; DESCRIPTION: Places a white 118x87 rectangle at position (101, 139).
; PLAN: r0=101(x), r1=139(y), r2=118(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 139
LDI r2, 118
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
