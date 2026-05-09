; DESCRIPTION: Places a yellow 98x78 rectangle at position (217, 155).
; PLAN: r0=217(x), r1=155(y), r2=98(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 155
LDI r2, 98
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
