; DESCRIPTION: Places a yellow 112x106 rectangle at position (25, 125).
; PLAN: r0=25(x), r1=125(y), r2=112(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 125
LDI r2, 112
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
