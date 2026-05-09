; DESCRIPTION: Places a orange 95x79 rectangle at position (54, 85).
; PLAN: r0=54(x), r1=85(y), r2=95(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 85
LDI r2, 95
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
