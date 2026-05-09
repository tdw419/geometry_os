; DESCRIPTION: Places a yellow 66x112 rectangle at position (426, 125).
; PLAN: r0=426(x), r1=125(y), r2=66(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 125
LDI r2, 66
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
