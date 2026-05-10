; DESCRIPTION: Places a cyan line segment connecting (412, 5) to (180, 21).
; PLAN: r0=412(x1), r1=5(y1), r2=180(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 5
LDI r2, 180
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
