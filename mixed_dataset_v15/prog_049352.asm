; DESCRIPTION: Draws a cyan line from (386, 62) to (267, 200).
; PLAN: r0=386(x1), r1=62(y1), r2=267(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 62
LDI r2, 267
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
