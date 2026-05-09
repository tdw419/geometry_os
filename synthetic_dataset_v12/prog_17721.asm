; DESCRIPTION: Draws a cyan line from (271, 47) to (45, 246).
; PLAN: r0=271(x1), r1=47(y1), r2=45(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 47
LDI r2, 45
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
