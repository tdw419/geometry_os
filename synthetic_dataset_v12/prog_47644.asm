; DESCRIPTION: Draws a cyan line from (504, 254) to (260, 225).
; PLAN: r0=504(x1), r1=254(y1), r2=260(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 254
LDI r2, 260
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
