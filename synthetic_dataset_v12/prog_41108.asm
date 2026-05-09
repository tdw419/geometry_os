; DESCRIPTION: Draws a cyan line from (477, 86) to (292, 171).
; PLAN: r0=477(x1), r1=86(y1), r2=292(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 86
LDI r2, 292
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
