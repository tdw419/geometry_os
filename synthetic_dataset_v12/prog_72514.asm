; DESCRIPTION: Draws a cyan line from (292, 31) to (481, 82).
; PLAN: r0=292(x1), r1=31(y1), r2=481(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 31
LDI r2, 481
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
