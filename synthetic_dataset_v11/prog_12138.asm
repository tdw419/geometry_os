; DESCRIPTION: Places a red 79x105 rectangle at position (44, 13).
; PLAN: r0=44(x), r1=13(y), r2=79(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 13
LDI r2, 79
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
