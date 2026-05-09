; DESCRIPTION: Places a green 109x87 rectangle at position (162, 54).
; PLAN: r0=162(x), r1=54(y), r2=109(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 54
LDI r2, 109
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
