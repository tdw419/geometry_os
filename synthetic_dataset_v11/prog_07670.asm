; DESCRIPTION: Renders a cyan line between points (86, 91) and (152, 117).
; PLAN: r0=86(x1), r1=91(y1), r2=152(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 91
LDI r2, 152
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
