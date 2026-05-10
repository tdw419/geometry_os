; DESCRIPTION: Places a black 18x86 rectangle at position (377, 65).
; PLAN: r0=377(x), r1=65(y), r2=18(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 65
LDI r2, 18
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
