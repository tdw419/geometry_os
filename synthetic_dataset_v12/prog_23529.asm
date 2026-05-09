; DESCRIPTION: Draws a cyan line from (309, 142) to (414, 166).
; PLAN: r0=309(x1), r1=142(y1), r2=414(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 142
LDI r2, 414
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
