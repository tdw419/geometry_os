; DESCRIPTION: Places a cyan line segment connecting (334, 215) to (274, 146).
; PLAN: r0=334(x1), r1=215(y1), r2=274(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 215
LDI r2, 274
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
