; DESCRIPTION: Renders a purple box of size 40x115 starting at (458, 21).
; PLAN: r0=458(x), r1=21(y), r2=40(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 21
LDI r2, 40
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
