; DESCRIPTION: Places a yellow 43x119 rectangle at position (440, 125).
; PLAN: r0=440(x), r1=125(y), r2=43(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 125
LDI r2, 43
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
