; DESCRIPTION: Renders a cyan line between points (103, 146) and (221, 221).
; PLAN: r0=103(x1), r1=146(y1), r2=221(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 146
LDI r2, 221
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
