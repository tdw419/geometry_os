; DESCRIPTION: Draws a blue line from (5, 98) to (386, 215).
; PLAN: r0=5(x1), r1=98(y1), r2=386(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 98
LDI r2, 386
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
