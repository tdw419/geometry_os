; DESCRIPTION: Places a black 65x54 rectangle at position (376, 86).
; PLAN: r0=376(x), r1=86(y), r2=65(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 86
LDI r2, 65
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
