; DESCRIPTION: Places a cyan line segment connecting (121, 240) to (150, 7).
; PLAN: r0=121(x1), r1=240(y1), r2=150(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 240
LDI r2, 150
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
