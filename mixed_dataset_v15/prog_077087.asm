; DESCRIPTION: Renders a cyan line between points (392, 70) and (377, 39).
; PLAN: r0=392(x1), r1=70(y1), r2=377(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 70
LDI r2, 377
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
