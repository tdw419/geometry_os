; DESCRIPTION: Renders a cyan box of size 49x81 starting at (185, 163).
; PLAN: r0=185(x), r1=163(y), r2=49(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 163
LDI r2, 49
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
