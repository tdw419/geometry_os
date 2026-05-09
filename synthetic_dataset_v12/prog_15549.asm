; DESCRIPTION: Places a black 75x65 rectangle at position (55, 70).
; PLAN: r0=55(x), r1=70(y), r2=75(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 70
LDI r2, 75
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
