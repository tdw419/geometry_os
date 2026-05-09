; DESCRIPTION: Places a purple 91x61 rectangle at position (25, 28).
; PLAN: r0=25(x), r1=28(y), r2=91(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 28
LDI r2, 91
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
