; DESCRIPTION: Places a red 99x72 rectangle at position (140, 115).
; PLAN: r0=140(x), r1=115(y), r2=99(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 115
LDI r2, 99
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
