; DESCRIPTION: Creates a vertical magenta gradient from black to magenta.
; PLAN: r0=CMP flag (17(x), r1=17(y), r2=0(width), r3=1(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 17
LDI r2, 0
LDI r3, 1
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
