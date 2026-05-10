; DESCRIPTION: Places a green 52x119 rectangle at position (307, 18).
; PLAN: r0=307(x), r1=18(y), r2=52(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 18
LDI r2, 52
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
