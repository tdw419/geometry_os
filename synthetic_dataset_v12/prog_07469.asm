; DESCRIPTION: Places a yellow 97x20 rectangle at position (367, 75).
; PLAN: r0=367(x), r1=75(y), r2=97(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 75
LDI r2, 97
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
