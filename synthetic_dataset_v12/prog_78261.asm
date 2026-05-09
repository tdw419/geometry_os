; DESCRIPTION: Places a cyan line segment connecting (180, 25) to (211, 128).
; PLAN: r0=180(x1), r1=25(y1), r2=211(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 25
LDI r2, 211
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
