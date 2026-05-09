; DESCRIPTION: Places a blue 52x82 rectangle at position (213, 79).
; PLAN: r0=213(x), r1=79(y), r2=52(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 79
LDI r2, 52
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
