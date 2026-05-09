; DESCRIPTION: Places a yellow 105x15 rectangle at position (138, 143).
; PLAN: r0=138(x), r1=143(y), r2=105(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 143
LDI r2, 105
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
