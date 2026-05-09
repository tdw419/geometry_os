; DESCRIPTION: Places a yellow 70x79 rectangle at position (99, 156).
; PLAN: r0=99(x), r1=156(y), r2=70(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 156
LDI r2, 70
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
