; DESCRIPTION: Places a green 80x79 rectangle at position (169, 5).
; PLAN: r0=169(x), r1=5(y), r2=80(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 5
LDI r2, 80
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
