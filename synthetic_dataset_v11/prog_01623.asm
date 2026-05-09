; DESCRIPTION: Places a red 35x20 rectangle at position (73, 216).
; PLAN: r0=73(x), r1=216(y), r2=35(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 216
LDI r2, 35
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
