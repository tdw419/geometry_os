; DESCRIPTION: Places a blue 11x34 rectangle at position (340, 2).
; PLAN: r0=340(x), r1=2(y), r2=11(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 2
LDI r2, 11
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
