; DESCRIPTION: Places a blue 107x80 rectangle at position (69, 132).
; PLAN: r0=69(x), r1=132(y), r2=107(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 132
LDI r2, 107
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
