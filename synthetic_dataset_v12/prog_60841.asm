; DESCRIPTION: Renders a blue box of size 27x117 starting at (48, 9).
; PLAN: r0=48(x), r1=9(y), r2=27(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 9
LDI r2, 27
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
