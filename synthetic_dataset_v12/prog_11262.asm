; DESCRIPTION: Draws a cyan line from (472, 98) to (47, 113).
; PLAN: r0=472(x1), r1=98(y1), r2=47(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 98
LDI r2, 47
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
