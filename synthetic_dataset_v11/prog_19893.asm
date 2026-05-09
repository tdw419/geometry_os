; DESCRIPTION: Places a blue 82x19 rectangle at position (120, 115).
; PLAN: r0=120(x), r1=115(y), r2=82(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 115
LDI r2, 82
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
