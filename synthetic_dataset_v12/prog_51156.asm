; DESCRIPTION: Renders a cyan line between points (420, 184) and (279, 108).
; PLAN: r0=420(x1), r1=184(y1), r2=279(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 184
LDI r2, 279
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
