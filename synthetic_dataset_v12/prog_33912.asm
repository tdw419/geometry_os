; DESCRIPTION: Places a red 59x107 rectangle at position (358, 63).
; PLAN: r0=358(x), r1=63(y), r2=59(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 63
LDI r2, 59
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
