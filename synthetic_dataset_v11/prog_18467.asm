; DESCRIPTION: Places a red 70x95 rectangle at position (93, 35).
; PLAN: r0=93(x), r1=35(y), r2=70(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 35
LDI r2, 70
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
