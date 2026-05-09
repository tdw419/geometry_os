; DESCRIPTION: Draws a blue line from (386, 40) to (394, 48).
; PLAN: r0=386(x1), r1=40(y1), r2=394(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 40
LDI r2, 394
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
