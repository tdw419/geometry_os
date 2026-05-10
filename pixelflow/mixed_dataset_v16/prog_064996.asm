; DESCRIPTION: Places a blue 24x11 box at position (386, 43).
; PLAN: r0=386(x), r1=43(y), r2=24(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 43
LDI r2, 24
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
