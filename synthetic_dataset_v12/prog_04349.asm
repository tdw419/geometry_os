; DESCRIPTION: Places a green 13x79 rectangle at position (226, 123).
; PLAN: r0=226(x), r1=123(y), r2=13(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 123
LDI r2, 13
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
