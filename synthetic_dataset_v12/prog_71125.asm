; DESCRIPTION: Renders a red line between points (242, 231) and (367, 69).
; PLAN: r0=242(x1), r1=231(y1), r2=367(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 231
LDI r2, 367
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
