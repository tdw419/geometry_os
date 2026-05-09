; DESCRIPTION: Places a green line segment connecting (243, 166) to (412, 152).
; PLAN: r0=243(x1), r1=166(y1), r2=412(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 166
LDI r2, 412
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
