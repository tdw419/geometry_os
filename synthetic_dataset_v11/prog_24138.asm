; DESCRIPTION: Places a yellow 102x79 rectangle at position (110, 24).
; PLAN: r0=110(x), r1=24(y), r2=102(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 24
LDI r2, 102
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
