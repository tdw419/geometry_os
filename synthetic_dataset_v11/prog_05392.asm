; DESCRIPTION: Places a cyan line segment connecting (32, 249) to (221, 142).
; PLAN: r0=32(x1), r1=249(y1), r2=221(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 249
LDI r2, 221
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
