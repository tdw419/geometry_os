; DESCRIPTION: Places a cyan line segment connecting (309, 205) to (252, 236).
; PLAN: r0=309(x1), r1=205(y1), r2=252(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 205
LDI r2, 252
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
