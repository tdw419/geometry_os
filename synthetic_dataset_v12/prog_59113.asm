; DESCRIPTION: Places a red 104x93 rectangle at position (337, 63).
; PLAN: r0=337(x), r1=63(y), r2=104(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 63
LDI r2, 104
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
