; DESCRIPTION: Places a red 34x92 rectangle at position (13, 37).
; PLAN: r0=13(x), r1=37(y), r2=34(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 37
LDI r2, 34
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
