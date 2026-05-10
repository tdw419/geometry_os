; DESCRIPTION: Renders a purple box of size 54x20 starting at (143, 160).
; PLAN: r0=143(x), r1=160(y), r2=54(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 160
LDI r2, 54
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
