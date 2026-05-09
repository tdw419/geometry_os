; DESCRIPTION: Places a yellow 86x21 rectangle at position (83, 198).
; PLAN: r0=83(x), r1=198(y), r2=86(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 198
LDI r2, 86
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
