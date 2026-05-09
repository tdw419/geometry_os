; DESCRIPTION: Places a red 118x57 rectangle at position (289, 127).
; PLAN: r0=289(x), r1=127(y), r2=118(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 127
LDI r2, 118
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
