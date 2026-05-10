; DESCRIPTION: Places a cyan line segment connecting (417, 196) to (53, 142).
; PLAN: r0=417(x1), r1=196(y1), r2=53(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 196
LDI r2, 53
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
