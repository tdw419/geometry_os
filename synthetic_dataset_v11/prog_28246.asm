; DESCRIPTION: Places a yellow 65x37 rectangle at position (106, 70).
; PLAN: r0=106(x), r1=70(y), r2=65(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 70
LDI r2, 65
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
