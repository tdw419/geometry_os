; DESCRIPTION: Places a cyan line segment connecting (242, 18) to (195, 213).
; PLAN: r0=242(x1), r1=18(y1), r2=195(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 18
LDI r2, 195
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
