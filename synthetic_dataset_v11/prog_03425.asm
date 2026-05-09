; DESCRIPTION: Renders a cyan line between points (231, 32) and (87, 219).
; PLAN: r0=231(x1), r1=32(y1), r2=87(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 32
LDI r2, 87
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
