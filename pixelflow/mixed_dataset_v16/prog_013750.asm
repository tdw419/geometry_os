; DESCRIPTION: Renders a cyan line between points (493, 154) and (103, 46).
; PLAN: r0=493(x1), r1=154(y1), r2=103(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 154
LDI r2, 103
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
