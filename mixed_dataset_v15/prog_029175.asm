; DESCRIPTION: Draws a cyan line from (386, 97) to (4, 44).
; PLAN: r0=386(x1), r1=97(y1), r2=4(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 97
LDI r2, 4
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
