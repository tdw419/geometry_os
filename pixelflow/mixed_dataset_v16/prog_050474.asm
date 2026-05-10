; DESCRIPTION: Places a red 79x104 rectangle at position (90, 99).
; PLAN: r0=90(x), r1=99(y), r2=79(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 99
LDI r2, 79
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
