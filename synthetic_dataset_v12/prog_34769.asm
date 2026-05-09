; DESCRIPTION: Places a yellow 16x105 rectangle at position (437, 125).
; PLAN: r0=437(x), r1=125(y), r2=16(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 125
LDI r2, 16
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
