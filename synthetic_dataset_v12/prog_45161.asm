; DESCRIPTION: Renders a blue box of size 24x110 starting at (27, 16).
; PLAN: r0=27(x), r1=16(y), r2=24(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 16
LDI r2, 24
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
