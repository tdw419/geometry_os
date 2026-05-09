; DESCRIPTION: Places a white line segment connecting (345, 58) to (286, 215).
; PLAN: r0=345(x1), r1=58(y1), r2=286(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 58
LDI r2, 286
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
