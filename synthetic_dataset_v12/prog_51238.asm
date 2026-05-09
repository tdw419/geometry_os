; DESCRIPTION: Renders a cyan line between points (25, 164) and (276, 38).
; PLAN: r0=25(x1), r1=164(y1), r2=276(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 164
LDI r2, 276
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
