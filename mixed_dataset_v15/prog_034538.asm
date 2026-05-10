; DESCRIPTION: Renders a cyan line between points (255, 46) and (263, 138).
; PLAN: r0=255(x1), r1=46(y1), r2=263(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 46
LDI r2, 263
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
