; DESCRIPTION: Places a yellow 11x23 rectangle at position (329, 12).
; PLAN: r0=329(x), r1=12(y), r2=11(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 12
LDI r2, 11
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
