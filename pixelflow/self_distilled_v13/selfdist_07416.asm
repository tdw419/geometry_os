; DESCRIPTION: Places a blue 36x40 box at position (172, 134).
; PLAN: r0=172(x), r1=134(y), r2=36(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 134
LDI r2, 36
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
