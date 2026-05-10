; DESCRIPTION: Places a green 11x10 box at position (143, 135).
; PLAN: r0=143(x), r1=135(y), r2=11(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 135
LDI r2, 11
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
