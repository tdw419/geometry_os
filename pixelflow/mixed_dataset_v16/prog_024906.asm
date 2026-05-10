; DESCRIPTION: Renders a purple box of size 44x115 starting at (455, 54).
; PLAN: r0=455(x), r1=54(y), r2=44(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 54
LDI r2, 44
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
