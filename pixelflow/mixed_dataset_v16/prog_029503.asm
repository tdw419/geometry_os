; DESCRIPTION: Renders a green box of size 102x78 starting at (111, 125).
; PLAN: r0=111(x), r1=125(y), r2=102(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 125
LDI r2, 102
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
