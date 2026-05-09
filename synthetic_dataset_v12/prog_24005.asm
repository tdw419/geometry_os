; DESCRIPTION: Draws a cyan line from (279, 154) to (338, 1).
; PLAN: r0=279(x1), r1=154(y1), r2=338(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 154
LDI r2, 338
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
