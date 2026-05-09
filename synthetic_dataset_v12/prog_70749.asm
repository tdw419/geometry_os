; DESCRIPTION: Draws a cyan line from (330, 120) to (258, 1).
; PLAN: r0=330(x1), r1=120(y1), r2=258(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 120
LDI r2, 258
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
