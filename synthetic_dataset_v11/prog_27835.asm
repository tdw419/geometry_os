; DESCRIPTION: Places a orange 94x23 rectangle at position (44, 125).
; PLAN: r0=44(x), r1=125(y), r2=94(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 125
LDI r2, 94
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
