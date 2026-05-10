; DESCRIPTION: Places a blue 54x70 box at position (152, 98).
; PLAN: r0=152(x), r1=98(y), r2=54(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 98
LDI r2, 54
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
