; DESCRIPTION: Draws a cyan line from (33, 36) to (193, 8).
; PLAN: r0=33(x1), r1=36(y1), r2=193(x2), r3=8(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 36
LDI r2, 193
LDI r3, 8
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
