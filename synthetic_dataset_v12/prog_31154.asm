; DESCRIPTION: Places a green 30x86 rectangle at position (430, 114).
; PLAN: r0=430(x), r1=114(y), r2=30(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 114
LDI r2, 30
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
