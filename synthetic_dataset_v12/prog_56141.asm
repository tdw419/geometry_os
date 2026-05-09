; DESCRIPTION: Places a red 94x55 rectangle at position (99, 31).
; PLAN: r0=99(x), r1=31(y), r2=94(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 31
LDI r2, 94
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
