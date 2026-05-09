; DESCRIPTION: Places a blue 27x97 rectangle at position (78, 11).
; PLAN: r0=78(x), r1=11(y), r2=27(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 11
LDI r2, 27
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
