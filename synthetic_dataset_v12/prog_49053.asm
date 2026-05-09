; DESCRIPTION: Places a red 22x90 rectangle at position (194, 61).
; PLAN: r0=194(x), r1=61(y), r2=22(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 61
LDI r2, 22
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
