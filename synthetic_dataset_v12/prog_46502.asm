; DESCRIPTION: Places a cyan line segment connecting (193, 249) to (294, 233).
; PLAN: r0=193(x1), r1=249(y1), r2=294(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 249
LDI r2, 294
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
