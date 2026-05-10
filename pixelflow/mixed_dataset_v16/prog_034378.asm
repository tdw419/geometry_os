; DESCRIPTION: Draws a cyan line from (82, 78) to (361, 91).
; PLAN: r0=82(x1), r1=78(y1), r2=361(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 78
LDI r2, 361
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
