; DESCRIPTION: Draws a cyan line from (380, 113) to (50, 223).
; PLAN: r0=380(x1), r1=113(y1), r2=50(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 113
LDI r2, 50
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
