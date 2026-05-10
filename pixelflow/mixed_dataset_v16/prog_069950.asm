; DESCRIPTION: Places a red 25x97 rectangle at position (156, 125).
; PLAN: r0=156(x), r1=125(y), r2=25(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 125
LDI r2, 25
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
