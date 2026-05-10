; DESCRIPTION: Draws a cyan line from (398, 71) to (250, 246).
; PLAN: r0=398(x1), r1=71(y1), r2=250(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 71
LDI r2, 250
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
