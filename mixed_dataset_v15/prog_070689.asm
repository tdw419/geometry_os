; DESCRIPTION: Renders a yellow box of size 79x102 starting at (87, 85).
; PLAN: r0=87(x), r1=85(y), r2=79(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 85
LDI r2, 79
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
