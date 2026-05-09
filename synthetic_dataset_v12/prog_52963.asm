; DESCRIPTION: Places a white line segment connecting (410, 241) to (277, 16).
; PLAN: r0=410(x1), r1=241(y1), r2=277(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 241
LDI r2, 277
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
