; DESCRIPTION: Places a cyan line segment connecting (198, 230) to (286, 40).
; PLAN: r0=198(x1), r1=230(y1), r2=286(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 230
LDI r2, 286
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
