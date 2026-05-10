; DESCRIPTION: Places a green 113x78 box at position (120, 181).
; PLAN: r0=120(x), r1=181(y), r2=113(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 181
LDI r2, 113
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
