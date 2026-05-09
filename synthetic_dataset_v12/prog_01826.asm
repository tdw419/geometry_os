; DESCRIPTION: Draws a cyan line from (445, 124) to (369, 193).
; PLAN: r0=445(x1), r1=124(y1), r2=369(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 124
LDI r2, 369
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
