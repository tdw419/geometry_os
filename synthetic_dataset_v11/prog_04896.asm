; DESCRIPTION: Renders a purple box of size 84x45 starting at (121, 164).
; PLAN: r0=121(x), r1=164(y), r2=84(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 164
LDI r2, 84
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
