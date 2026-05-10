; DESCRIPTION: Draws a cyan line from (160, 129) to (377, 243).
; PLAN: r0=160(x1), r1=129(y1), r2=377(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 129
LDI r2, 377
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
