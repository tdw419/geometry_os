; DESCRIPTION: Renders a blue box of size 48x19 starting at (117, 172).
; PLAN: r0=117(x), r1=172(y), r2=48(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 172
LDI r2, 48
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
