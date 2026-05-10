; DESCRIPTION: Places a red 87x77 rectangle at position (170, 99).
; PLAN: r0=170(x), r1=99(y), r2=87(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 99
LDI r2, 87
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
