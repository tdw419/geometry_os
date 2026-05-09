; DESCRIPTION: Places a purple 91x97 rectangle at position (151, 95).
; PLAN: r0=151(x), r1=95(y), r2=91(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 95
LDI r2, 91
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
