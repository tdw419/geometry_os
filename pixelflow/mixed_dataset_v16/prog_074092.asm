; DESCRIPTION: Places a red 34x57 rectangle at position (212, 48).
; PLAN: r0=212(x), r1=48(y), r2=34(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 48
LDI r2, 34
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
