; DESCRIPTION: Places a red 15x83 rectangle at position (19, 40).
; PLAN: r0=19(x), r1=40(y), r2=15(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 40
LDI r2, 15
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
