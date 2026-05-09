; DESCRIPTION: Places a red 97x28 rectangle at position (27, 79).
; PLAN: r0=27(x), r1=79(y), r2=97(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 79
LDI r2, 97
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
