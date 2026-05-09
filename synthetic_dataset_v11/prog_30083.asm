; DESCRIPTION: Places a white 119x44 rectangle at position (121, 205).
; PLAN: r0=121(x), r1=205(y), r2=119(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 205
LDI r2, 119
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
