; DESCRIPTION: Renders a green box of size 107x33 starting at (111, 196).
; PLAN: r0=111(x), r1=196(y), r2=107(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 196
LDI r2, 107
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
