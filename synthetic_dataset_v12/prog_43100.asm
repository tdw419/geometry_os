; DESCRIPTION: Places a red 70x83 rectangle at position (216, 31).
; PLAN: r0=216(x), r1=31(y), r2=70(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 31
LDI r2, 70
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
