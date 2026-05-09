; DESCRIPTION: Places a white 79x36 rectangle at position (113, 97).
; PLAN: r0=113(x), r1=97(y), r2=79(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 97
LDI r2, 79
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
