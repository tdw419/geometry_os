; DESCRIPTION: Renders a blue box of size 29x86 starting at (327, 51).
; PLAN: r0=327(x), r1=51(y), r2=29(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 51
LDI r2, 29
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
