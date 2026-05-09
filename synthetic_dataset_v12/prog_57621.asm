; DESCRIPTION: Renders a blue box of size 70x47 starting at (115, 40).
; PLAN: r0=115(x), r1=40(y), r2=70(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 40
LDI r2, 70
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
