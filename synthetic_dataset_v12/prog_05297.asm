; DESCRIPTION: Renders a green box of size 92x96 starting at (258, 125).
; PLAN: r0=258(x), r1=125(y), r2=92(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 125
LDI r2, 92
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
