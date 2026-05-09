; DESCRIPTION: Places a red 33x70 rectangle at position (216, 158).
; PLAN: r0=216(x), r1=158(y), r2=33(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 158
LDI r2, 33
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
