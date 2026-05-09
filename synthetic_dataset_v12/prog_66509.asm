; DESCRIPTION: Renders a purple box of size 40x98 starting at (443, 54).
; PLAN: r0=443(x), r1=54(y), r2=40(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 54
LDI r2, 40
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
