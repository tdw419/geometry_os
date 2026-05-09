; DESCRIPTION: Renders a cyan line between points (16, 6) and (502, 141).
; PLAN: r0=16(x1), r1=6(y1), r2=502(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 6
LDI r2, 502
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
