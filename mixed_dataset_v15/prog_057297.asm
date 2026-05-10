; DESCRIPTION: Renders a cyan line between points (207, 32) and (131, 17).
; PLAN: r0=207(x1), r1=32(y1), r2=131(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 32
LDI r2, 131
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
