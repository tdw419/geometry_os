; DESCRIPTION: Places a cyan line segment connecting (90, 215) to (336, 71).
; PLAN: r0=90(x1), r1=215(y1), r2=336(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 215
LDI r2, 336
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
