; DESCRIPTION: Draws a cyan line from (17, 100) to (32, 221).
; PLAN: r0=17(x1), r1=100(y1), r2=32(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 100
LDI r2, 32
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
