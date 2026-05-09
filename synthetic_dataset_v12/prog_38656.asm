; DESCRIPTION: Places a blue 82x82 rectangle at position (328, 87).
; PLAN: r0=328(x), r1=87(y), r2=82(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 87
LDI r2, 82
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
