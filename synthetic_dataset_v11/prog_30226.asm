; DESCRIPTION: Renders a purple box of size 79x14 starting at (10, 146).
; PLAN: r0=10(x), r1=146(y), r2=79(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 146
LDI r2, 79
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
