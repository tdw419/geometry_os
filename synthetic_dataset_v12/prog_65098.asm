; DESCRIPTION: Renders a purple box of size 51x50 starting at (445, 54).
; PLAN: r0=445(x), r1=54(y), r2=51(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 54
LDI r2, 51
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
