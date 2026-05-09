; DESCRIPTION: Places a green 28x30 rectangle at position (464, 4).
; PLAN: r0=464(x), r1=4(y), r2=28(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 4
LDI r2, 28
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
