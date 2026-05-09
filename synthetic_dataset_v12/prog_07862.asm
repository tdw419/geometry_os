; DESCRIPTION: Places a blue 116x25 rectangle at position (293, 50).
; PLAN: r0=293(x), r1=50(y), r2=116(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 50
LDI r2, 116
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
