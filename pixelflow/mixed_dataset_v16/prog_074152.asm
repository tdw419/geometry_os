; DESCRIPTION: Places a yellow 113x69 box at position (57, 119).
; PLAN: r0=57(x), r1=119(y), r2=113(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 119
LDI r2, 113
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
