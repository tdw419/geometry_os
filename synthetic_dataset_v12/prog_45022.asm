; DESCRIPTION: Draws a cyan line from (29, 74) to (337, 82).
; PLAN: r0=29(x1), r1=74(y1), r2=337(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 74
LDI r2, 337
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
