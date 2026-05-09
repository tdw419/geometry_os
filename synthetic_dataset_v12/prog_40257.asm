; DESCRIPTION: Places a red 11x68 rectangle at position (466, 166).
; PLAN: r0=466(x), r1=166(y), r2=11(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 166
LDI r2, 11
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
