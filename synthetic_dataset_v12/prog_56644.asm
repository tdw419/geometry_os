; DESCRIPTION: Renders a purple box of size 27x33 starting at (49, 168).
; PLAN: r0=49(x), r1=168(y), r2=27(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 168
LDI r2, 27
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
