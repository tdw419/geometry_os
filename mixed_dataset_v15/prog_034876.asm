; DESCRIPTION: Places a yellow 86x23 rectangle at position (396, 142).
; PLAN: r0=396(x), r1=142(y), r2=86(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 142
LDI r2, 86
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
