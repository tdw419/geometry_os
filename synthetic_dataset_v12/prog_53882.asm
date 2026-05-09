; DESCRIPTION: Places a red 115x34 rectangle at position (120, 203).
; PLAN: r0=120(x), r1=203(y), r2=115(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 203
LDI r2, 115
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
