; DESCRIPTION: Places a green 25x105 rectangle at position (124, 93).
; PLAN: r0=124(x), r1=93(y), r2=25(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 93
LDI r2, 25
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
