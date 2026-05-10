; DESCRIPTION: Places a white line segment connecting (465, 17) to (401, 197).
; PLAN: r0=465(x1), r1=17(y1), r2=401(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 17
LDI r2, 401
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
