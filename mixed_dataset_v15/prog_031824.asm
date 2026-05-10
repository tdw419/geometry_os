; DESCRIPTION: Places a red 85x36 rectangle at position (212, 79).
; PLAN: r0=212(x), r1=79(y), r2=85(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 79
LDI r2, 85
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
