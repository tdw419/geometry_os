; DESCRIPTION: Places a blue line segment connecting (180, 146) to (20, 164).
; PLAN: r0=180(x1), r1=146(y1), r2=20(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 146
LDI r2, 20
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
