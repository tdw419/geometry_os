; DESCRIPTION: Renders a blue box of size 97x98 starting at (330, 125).
; PLAN: r0=330(x), r1=125(y), r2=97(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 125
LDI r2, 97
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
