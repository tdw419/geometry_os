; DESCRIPTION: Places a white 17x75 rectangle at position (191, 168).
; PLAN: r0=191(x), r1=168(y), r2=17(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 168
LDI r2, 17
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
