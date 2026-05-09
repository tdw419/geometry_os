; DESCRIPTION: Renders a blue box of size 27x45 starting at (39, 135).
; PLAN: r0=39(x), r1=135(y), r2=27(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 135
LDI r2, 27
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
