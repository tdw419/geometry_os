; DESCRIPTION: Places a red 82x107 rectangle at position (1, 1).
; PLAN: r0=1(x), r1=1(y), r2=82(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 1
LDI r2, 82
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
