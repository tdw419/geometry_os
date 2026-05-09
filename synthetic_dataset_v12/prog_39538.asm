; DESCRIPTION: Places a blue 43x52 rectangle at position (31, 124).
; PLAN: r0=31(x), r1=124(y), r2=43(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 124
LDI r2, 43
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
