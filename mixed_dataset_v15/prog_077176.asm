; DESCRIPTION: Renders a yellow box of size 12x70 starting at (220, 55).
; PLAN: r0=220(x), r1=55(y), r2=12(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 55
LDI r2, 12
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
