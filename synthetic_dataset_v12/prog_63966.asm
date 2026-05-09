; DESCRIPTION: Places a cyan line segment connecting (242, 161) to (85, 213).
; PLAN: r0=242(x1), r1=161(y1), r2=85(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 161
LDI r2, 85
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
