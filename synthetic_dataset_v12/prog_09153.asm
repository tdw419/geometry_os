; DESCRIPTION: Places a magenta line segment connecting (502, 230) to (494, 231).
; PLAN: r0=502(x1), r1=230(y1), r2=494(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 230
LDI r2, 494
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
