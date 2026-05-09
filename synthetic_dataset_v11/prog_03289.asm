; DESCRIPTION: Places a yellow 14x86 rectangle at position (195, 78).
; PLAN: r0=195(x), r1=78(y), r2=14(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 78
LDI r2, 14
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
