; DESCRIPTION: Places a cyan 23x86 box at position (318, 123).
; PLAN: r0=318(x), r1=123(y), r2=23(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 123
LDI r2, 23
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
