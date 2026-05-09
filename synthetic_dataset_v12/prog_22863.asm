; DESCRIPTION: Places a green line segment connecting (410, 146) to (313, 208).
; PLAN: r0=410(x1), r1=146(y1), r2=313(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 146
LDI r2, 313
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
