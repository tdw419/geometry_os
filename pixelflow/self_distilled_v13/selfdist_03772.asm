; DESCRIPTION: Renders a green rectangular region spanning 51 by 57 at (281, 108).
; PLAN: r0=281(x), r1=108(y), r2=51(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 108
LDI r2, 51
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
