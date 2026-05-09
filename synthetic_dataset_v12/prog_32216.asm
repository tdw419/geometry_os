; DESCRIPTION: Places a red 107x26 rectangle at position (109, 15).
; PLAN: r0=109(x), r1=15(y), r2=107(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 15
LDI r2, 107
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
