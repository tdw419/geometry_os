; DESCRIPTION: Places a blue 113x15 box at position (255, 46).
; PLAN: r0=255(x), r1=46(y), r2=113(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 46
LDI r2, 113
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
