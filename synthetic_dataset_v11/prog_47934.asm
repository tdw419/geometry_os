; DESCRIPTION: Places a green 39x12 rectangle at position (12, 125).
; PLAN: r0=12(x), r1=125(y), r2=39(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 125
LDI r2, 39
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
