; DESCRIPTION: Draws a cyan line from (450, 73) to (409, 81).
; PLAN: r0=450(x1), r1=73(y1), r2=409(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 73
LDI r2, 409
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
