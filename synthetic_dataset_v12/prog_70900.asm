; DESCRIPTION: Places a white 97x111 rectangle at position (115, 119).
; PLAN: r0=115(x), r1=119(y), r2=97(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 119
LDI r2, 97
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
