; DESCRIPTION: Places a blue 79x50 rectangle at position (349, 113).
; PLAN: r0=349(x), r1=113(y), r2=79(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 113
LDI r2, 79
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
