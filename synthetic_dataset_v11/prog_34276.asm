; DESCRIPTION: Renders a blue box of size 80x90 starting at (18, 28).
; PLAN: r0=18(x), r1=28(y), r2=80(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 28
LDI r2, 80
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
