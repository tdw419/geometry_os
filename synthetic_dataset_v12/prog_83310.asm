; DESCRIPTION: Places a red 28x61 rectangle at position (35, 155).
; PLAN: r0=35(x), r1=155(y), r2=28(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 155
LDI r2, 28
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
