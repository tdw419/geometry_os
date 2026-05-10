; DESCRIPTION: Places a purple 32x110 rectangle at position (460, 28).
; PLAN: r0=460(x), r1=28(y), r2=32(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 28
LDI r2, 32
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
