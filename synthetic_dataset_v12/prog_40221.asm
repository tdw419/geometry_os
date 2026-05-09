; DESCRIPTION: Places a white 97x66 rectangle at position (377, 190).
; PLAN: r0=377(x), r1=190(y), r2=97(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 190
LDI r2, 97
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
