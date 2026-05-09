; DESCRIPTION: Places a blue 52x34 rectangle at position (365, 125).
; PLAN: r0=365(x), r1=125(y), r2=52(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 125
LDI r2, 52
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
