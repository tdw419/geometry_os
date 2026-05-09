; DESCRIPTION: Places a yellow 43x105 rectangle at position (0, 132).
; PLAN: r0=0(x), r1=132(y), r2=43(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 132
LDI r2, 43
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
