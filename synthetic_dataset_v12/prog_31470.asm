; DESCRIPTION: Places a green 81x11 rectangle at position (127, 33).
; PLAN: r0=127(x), r1=33(y), r2=81(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 33
LDI r2, 81
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
