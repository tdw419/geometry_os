; DESCRIPTION: Places a cyan line segment connecting (87, 246) to (127, 174).
; PLAN: r0=87(x1), r1=246(y1), r2=127(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 246
LDI r2, 127
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
