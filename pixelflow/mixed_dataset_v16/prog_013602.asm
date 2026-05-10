; DESCRIPTION: Places a blue 120x78 box at position (175, 50).
; PLAN: r0=175(x), r1=50(y), r2=120(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 50
LDI r2, 120
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
