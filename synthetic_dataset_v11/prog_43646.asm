; DESCRIPTION: Places a blue 18x17 rectangle at position (112, 157).
; PLAN: r0=112(x), r1=157(y), r2=18(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 157
LDI r2, 18
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
