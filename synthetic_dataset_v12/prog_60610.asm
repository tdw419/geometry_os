; DESCRIPTION: Places a green 59x19 rectangle at position (278, 140).
; PLAN: r0=278(x), r1=140(y), r2=59(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 140
LDI r2, 59
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
