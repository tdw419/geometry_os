; DESCRIPTION: Renders a cyan line between points (32, 143) and (223, 63).
; PLAN: r0=32(x1), r1=143(y1), r2=223(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 143
LDI r2, 223
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
