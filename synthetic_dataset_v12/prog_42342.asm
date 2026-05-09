; DESCRIPTION: Renders a purple box of size 58x79 starting at (146, 120).
; PLAN: r0=146(x), r1=120(y), r2=58(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 120
LDI r2, 58
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
