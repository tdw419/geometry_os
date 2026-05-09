; DESCRIPTION: Renders a cyan line between points (152, 33) and (183, 37).
; PLAN: r0=152(x1), r1=33(y1), r2=183(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 33
LDI r2, 183
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
