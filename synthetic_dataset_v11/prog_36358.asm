; DESCRIPTION: Renders a purple box of size 25x62 starting at (146, 27).
; PLAN: r0=146(x), r1=27(y), r2=25(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 27
LDI r2, 25
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
