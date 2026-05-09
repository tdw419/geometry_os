; DESCRIPTION: Places a blue 12x91 rectangle at position (499, 94).
; PLAN: r0=499(x), r1=94(y), r2=12(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 94
LDI r2, 12
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
