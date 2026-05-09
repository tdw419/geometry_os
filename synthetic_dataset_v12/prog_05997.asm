; DESCRIPTION: Places a blue 83x52 rectangle at position (338, 165).
; PLAN: r0=338(x), r1=165(y), r2=83(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 165
LDI r2, 83
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
