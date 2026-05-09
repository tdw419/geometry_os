; DESCRIPTION: Draws a cyan line from (98, 131) to (243, 182).
; PLAN: r0=98(x1), r1=131(y1), r2=243(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 131
LDI r2, 243
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
