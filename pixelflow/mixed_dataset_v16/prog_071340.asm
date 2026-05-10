; DESCRIPTION: Places a blue 61x119 rectangle at position (320, 119).
; PLAN: r0=320(x), r1=119(y), r2=61(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 119
LDI r2, 61
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
