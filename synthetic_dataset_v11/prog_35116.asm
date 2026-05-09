; DESCRIPTION: Renders a green line between points (215, 55) and (42, 160).
; PLAN: r0=215(x1), r1=55(y1), r2=42(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 55
LDI r2, 42
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
