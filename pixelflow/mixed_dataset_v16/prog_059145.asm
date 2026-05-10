; DESCRIPTION: Renders a blue box of size 96x20 starting at (372, 187).
; PLAN: r0=372(x), r1=187(y), r2=96(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 187
LDI r2, 96
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
