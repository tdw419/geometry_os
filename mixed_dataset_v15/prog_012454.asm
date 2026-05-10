; DESCRIPTION: Places a white 117x93 box at position (280, 12).
; PLAN: r0=280(x), r1=12(y), r2=117(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 12
LDI r2, 117
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
