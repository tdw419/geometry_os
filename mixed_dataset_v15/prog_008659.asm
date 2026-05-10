; DESCRIPTION: Renders a cyan rectangular region spanning 51 by 111 at (35, 105).
; PLAN: r0=35(x), r1=105(y), r2=51(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 105
LDI r2, 51
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
