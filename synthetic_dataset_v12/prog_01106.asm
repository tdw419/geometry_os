; DESCRIPTION: Draws a cyan line from (446, 30) to (124, 23).
; PLAN: r0=446(x1), r1=30(y1), r2=124(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 30
LDI r2, 124
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
