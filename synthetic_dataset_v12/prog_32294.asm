; DESCRIPTION: Places a yellow 117x86 rectangle at position (257, 127).
; PLAN: r0=257(x), r1=127(y), r2=117(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 127
LDI r2, 117
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
