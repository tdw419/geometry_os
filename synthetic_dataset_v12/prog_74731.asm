; DESCRIPTION: Renders a purple box of size 102x49 starting at (389, 146).
; PLAN: r0=389(x), r1=146(y), r2=102(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 146
LDI r2, 102
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
