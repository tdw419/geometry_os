; DESCRIPTION: Places a yellow 90x29 rectangle at position (267, 122).
; PLAN: r0=267(x), r1=122(y), r2=90(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 122
LDI r2, 90
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
