; DESCRIPTION: Places a cyan line segment connecting (115, 154) to (69, 164).
; PLAN: r0=115(x1), r1=154(y1), r2=69(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 154
LDI r2, 69
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
