; DESCRIPTION: Places a blue 44x19 rectangle at position (71, 9).
; PLAN: r0=71(x), r1=9(y), r2=44(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 9
LDI r2, 44
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
