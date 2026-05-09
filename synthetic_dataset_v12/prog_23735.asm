; DESCRIPTION: Renders a blue box of size 52x95 starting at (180, 150).
; PLAN: r0=180(x), r1=150(y), r2=52(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 150
LDI r2, 52
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
