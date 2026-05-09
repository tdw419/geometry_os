; DESCRIPTION: Places a red 99x87 rectangle at position (40, 94).
; PLAN: r0=40(x), r1=94(y), r2=99(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 94
LDI r2, 99
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
