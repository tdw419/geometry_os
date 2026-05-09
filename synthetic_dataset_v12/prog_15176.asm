; DESCRIPTION: Places a blue 55x75 rectangle at position (150, 106).
; PLAN: r0=150(x), r1=106(y), r2=55(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 106
LDI r2, 55
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
