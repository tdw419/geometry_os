; DESCRIPTION: Places a yellow 30x86 rectangle at position (390, 21).
; PLAN: r0=390(x), r1=21(y), r2=30(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 21
LDI r2, 30
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
