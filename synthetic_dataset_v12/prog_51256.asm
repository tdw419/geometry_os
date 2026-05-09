; DESCRIPTION: Places a white 97x30 rectangle at position (220, 171).
; PLAN: r0=220(x), r1=171(y), r2=97(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 171
LDI r2, 97
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
