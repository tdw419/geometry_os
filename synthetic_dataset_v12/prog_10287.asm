; DESCRIPTION: Places a red 34x79 rectangle at position (282, 43).
; PLAN: r0=282(x), r1=43(y), r2=34(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 43
LDI r2, 34
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
