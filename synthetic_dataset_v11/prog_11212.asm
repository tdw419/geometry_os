; DESCRIPTION: Renders a cyan line between points (61, 59) and (95, 206).
; PLAN: r0=61(x1), r1=59(y1), r2=95(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 59
LDI r2, 95
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
