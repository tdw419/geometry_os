; DESCRIPTION: Draws a green line from (319, 32) to (488, 218).
; PLAN: r0=319(x1), r1=32(y1), r2=488(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 32
LDI r2, 488
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
