; DESCRIPTION: Places a red 70x101 rectangle at position (335, 134).
; PLAN: r0=335(x), r1=134(y), r2=70(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 134
LDI r2, 70
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
