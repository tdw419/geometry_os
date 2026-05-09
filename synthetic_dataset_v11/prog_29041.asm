; DESCRIPTION: Places a green 81x77 rectangle at position (36, 139).
; PLAN: r0=36(x), r1=139(y), r2=81(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 139
LDI r2, 81
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
