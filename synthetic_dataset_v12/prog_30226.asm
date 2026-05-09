; DESCRIPTION: Renders a cyan line between points (160, 239) and (437, 33).
; PLAN: r0=160(x1), r1=239(y1), r2=437(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 239
LDI r2, 437
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
