; DESCRIPTION: Places a green 27x26 rectangle at position (52, 49).
; PLAN: r0=52(x), r1=49(y), r2=27(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 49
LDI r2, 27
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
