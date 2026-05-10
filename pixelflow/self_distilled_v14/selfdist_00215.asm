; DESCRIPTION: Places a magenta 16x75 box at position (30, 152).
; PLAN: r0=30(x), r1=152(y), r2=16(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 152
LDI r2, 16
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
