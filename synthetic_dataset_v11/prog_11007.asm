; DESCRIPTION: Places a purple 120x85 rectangle at position (9, 125).
; PLAN: r0=9(x), r1=125(y), r2=120(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 125
LDI r2, 120
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
