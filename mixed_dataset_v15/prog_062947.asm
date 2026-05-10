; DESCRIPTION: Places a red 10x34 rectangle at position (427, 156).
; PLAN: r0=427(x), r1=156(y), r2=10(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 156
LDI r2, 10
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
