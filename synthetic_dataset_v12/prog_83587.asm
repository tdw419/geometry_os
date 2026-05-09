; DESCRIPTION: Places a purple 28x105 rectangle at position (223, 38).
; PLAN: r0=223(x), r1=38(y), r2=28(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 38
LDI r2, 28
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
