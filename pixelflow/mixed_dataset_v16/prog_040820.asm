; DESCRIPTION: Creates a purple filled rectangle of size 10x62 starting at (146, 127).
; PLAN: r0=146(x), r1=127(y), r2=10(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 127
LDI r2, 10
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
