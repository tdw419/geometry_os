; DESCRIPTION: Renders a cyan line between points (485, 208) and (465, 45).
; PLAN: r0=485(x1), r1=208(y1), r2=465(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 208
LDI r2, 465
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
