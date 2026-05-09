; DESCRIPTION: Places a green 44x117 rectangle at position (203, 125).
; PLAN: r0=203(x), r1=125(y), r2=44(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 125
LDI r2, 44
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
