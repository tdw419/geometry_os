; DESCRIPTION: Places a yellow 119x39 rectangle at position (115, 179).
; PLAN: r0=115(x), r1=179(y), r2=119(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 179
LDI r2, 119
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
