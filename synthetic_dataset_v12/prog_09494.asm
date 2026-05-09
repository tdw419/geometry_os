; DESCRIPTION: Places a magenta 81x107 rectangle at position (281, 27).
; PLAN: r0=281(x), r1=27(y), r2=81(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 27
LDI r2, 81
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
