; DESCRIPTION: Places a yellow 93x107 rectangle at position (39, 122).
; PLAN: r0=39(x), r1=122(y), r2=93(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 122
LDI r2, 93
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
