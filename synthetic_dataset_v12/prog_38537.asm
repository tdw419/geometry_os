; DESCRIPTION: Places a red 65x117 rectangle at position (382, 12).
; PLAN: r0=382(x), r1=12(y), r2=65(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 12
LDI r2, 65
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
