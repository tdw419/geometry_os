; DESCRIPTION: Places a orange 84x10 rectangle at position (116, 54).
; PLAN: r0=116(x), r1=54(y), r2=84(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 54
LDI r2, 84
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
