; DESCRIPTION: Draws a cyan line from (82, 28) to (207, 112).
; PLAN: r0=82(x1), r1=28(y1), r2=207(x2), r3=112(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 28
LDI r2, 207
LDI r3, 112
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
