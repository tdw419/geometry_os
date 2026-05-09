; DESCRIPTION: Renders a cyan line between points (13, 76) and (487, 63).
; PLAN: r0=13(x1), r1=76(y1), r2=487(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 76
LDI r2, 487
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
