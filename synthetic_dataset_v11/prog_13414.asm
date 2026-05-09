; DESCRIPTION: Places a blue 70x35 rectangle at position (174, 98).
; PLAN: r0=174(x), r1=98(y), r2=70(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 98
LDI r2, 70
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
