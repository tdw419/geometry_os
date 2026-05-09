; DESCRIPTION: Places a red 94x109 rectangle at position (241, 74).
; PLAN: r0=241(x), r1=74(y), r2=94(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 74
LDI r2, 94
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
