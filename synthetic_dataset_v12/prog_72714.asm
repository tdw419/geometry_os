; DESCRIPTION: Renders a purple box of size 75x50 starting at (180, 27).
; PLAN: r0=180(x), r1=27(y), r2=75(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 27
LDI r2, 75
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
