; DESCRIPTION: Draws a cyan line from (240, 22) to (386, 45).
; PLAN: r0=240(x1), r1=22(y1), r2=386(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 22
LDI r2, 386
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
