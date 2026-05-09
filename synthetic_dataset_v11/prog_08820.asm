; DESCRIPTION: Places a orange 98x79 rectangle at position (12, 109).
; PLAN: r0=12(x), r1=109(y), r2=98(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 109
LDI r2, 98
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
