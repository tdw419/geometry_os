; DESCRIPTION: Renders a purple box of size 65x29 starting at (220, 221).
; PLAN: r0=220(x), r1=221(y), r2=65(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 221
LDI r2, 65
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
