; DESCRIPTION: Draws a cyan line from (49, 214) to (30, 43).
; PLAN: r0=49(x1), r1=214(y1), r2=30(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 214
LDI r2, 30
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
