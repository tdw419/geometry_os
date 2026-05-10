; DESCRIPTION: Draws a cyan line from (343, 130) to (244, 43).
; PLAN: r0=343(x1), r1=130(y1), r2=244(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 130
LDI r2, 244
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
