; DESCRIPTION: Places a cyan line segment connecting (125, 50) to (101, 164).
; PLAN: r0=125(x1), r1=50(y1), r2=101(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 50
LDI r2, 101
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
