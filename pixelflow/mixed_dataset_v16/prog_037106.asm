; DESCRIPTION: Places a green 28x88 box at position (400, 128).
; PLAN: r0=400(x), r1=128(y), r2=28(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 128
LDI r2, 28
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
