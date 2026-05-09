; DESCRIPTION: Draws a cyan line from (466, 154) to (466, 18).
; PLAN: r0=466(x1), r1=154(y1), r2=466(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 154
LDI r2, 466
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
