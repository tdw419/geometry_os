; DESCRIPTION: Places a red 110x116 rectangle at position (357, 68).
; PLAN: r0=357(x), r1=68(y), r2=110(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 68
LDI r2, 110
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
