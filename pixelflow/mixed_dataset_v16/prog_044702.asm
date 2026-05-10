; DESCRIPTION: Renders a purple box of size 75x70 starting at (187, 35).
; PLAN: r0=187(x), r1=35(y), r2=75(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 35
LDI r2, 75
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
