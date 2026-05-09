; DESCRIPTION: Places a orange 93x47 rectangle at position (216, 3).
; PLAN: r0=216(x), r1=3(y), r2=93(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 3
LDI r2, 93
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
