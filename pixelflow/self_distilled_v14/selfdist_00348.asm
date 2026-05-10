; DESCRIPTION: Renders a cyan rectangular region spanning 84 by 58 at (254, 51).
; PLAN: r0=254(x), r1=51(y), r2=84(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 51
LDI r2, 84
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
