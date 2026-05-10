; DESCRIPTION: Renders a cyan line segment connecting (68, 33) to (215, 162).
; PLAN: r0=68(x1), r1=33(y1), r2=215(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 33
LDI r2, 215
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
