; DESCRIPTION: Renders a white line between points (173, 243) and (32, 192).
; PLAN: r0=173(x1), r1=243(y1), r2=32(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 243
LDI r2, 32
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
