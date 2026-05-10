; DESCRIPTION: Places a red 54x15 rectangle at position (268, 80).
; PLAN: r0=268(x), r1=80(y), r2=54(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 80
LDI r2, 54
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
