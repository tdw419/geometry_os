; DESCRIPTION: Renders a blue box of size 16x46 starting at (486, 196).
; PLAN: r0=486(x), r1=196(y), r2=16(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 196
LDI r2, 16
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
