; DESCRIPTION: Places a red 85x27 rectangle at position (155, 144).
; PLAN: r0=155(x), r1=144(y), r2=85(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 144
LDI r2, 85
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
