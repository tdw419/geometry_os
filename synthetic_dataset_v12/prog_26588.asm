; DESCRIPTION: Places a blue 30x60 rectangle at position (215, 70).
; PLAN: r0=215(x), r1=70(y), r2=30(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 70
LDI r2, 30
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
