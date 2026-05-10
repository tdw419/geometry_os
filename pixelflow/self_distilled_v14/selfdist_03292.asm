; DESCRIPTION: Places a green 113x44 box at position (5, 46).
; PLAN: r0=5(x), r1=46(y), r2=113(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 46
LDI r2, 113
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
