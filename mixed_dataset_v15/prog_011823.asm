; DESCRIPTION: Places a yellow 30x105 rectangle at position (455, 6).
; PLAN: r0=455(x), r1=6(y), r2=30(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 6
LDI r2, 30
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
