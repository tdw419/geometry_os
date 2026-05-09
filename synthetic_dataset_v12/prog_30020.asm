; DESCRIPTION: Renders a purple box of size 25x20 starting at (214, 21).
; PLAN: r0=214(x), r1=21(y), r2=25(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 21
LDI r2, 25
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
