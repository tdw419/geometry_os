; DESCRIPTION: Places a red 107x23 rectangle at position (66, 36).
; PLAN: r0=66(x), r1=36(y), r2=107(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 36
LDI r2, 107
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
