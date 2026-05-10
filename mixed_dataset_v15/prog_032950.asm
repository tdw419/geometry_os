; DESCRIPTION: Places a purple 106x10 box at position (173, 56).
; PLAN: r0=173(x), r1=56(y), r2=106(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 56
LDI r2, 106
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
