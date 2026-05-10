; DESCRIPTION: Places a red 120x26 rectangle at position (15, 109).
; PLAN: r0=15(x), r1=109(y), r2=120(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 109
LDI r2, 120
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
