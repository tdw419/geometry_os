; DESCRIPTION: Draws a cyan line from (260, 64) to (392, 17).
; PLAN: r0=260(x1), r1=64(y1), r2=392(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 64
LDI r2, 392
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
