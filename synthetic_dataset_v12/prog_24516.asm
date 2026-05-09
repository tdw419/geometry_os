; DESCRIPTION: Places a green 112x25 rectangle at position (343, 25).
; PLAN: r0=343(x), r1=25(y), r2=112(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 25
LDI r2, 112
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
