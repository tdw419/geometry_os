; DESCRIPTION: Places a purple 28x87 rectangle at position (127, 56).
; PLAN: r0=127(x), r1=56(y), r2=28(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 56
LDI r2, 28
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
