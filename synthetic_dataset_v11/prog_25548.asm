; DESCRIPTION: Places a red 27x107 rectangle at position (11, 68).
; PLAN: r0=11(x), r1=68(y), r2=27(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 68
LDI r2, 27
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
