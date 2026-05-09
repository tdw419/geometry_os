; DESCRIPTION: Draws a cyan line from (380, 125) to (500, 83).
; PLAN: r0=380(x1), r1=125(y1), r2=500(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 125
LDI r2, 500
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
