; DESCRIPTION: Places a red 56x26 rectangle at position (85, 182).
; PLAN: r0=85(x), r1=182(y), r2=56(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 182
LDI r2, 56
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
