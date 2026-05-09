; DESCRIPTION: Draws a cyan line from (127, 206) to (70, 43).
; PLAN: r0=127(x1), r1=206(y1), r2=70(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 206
LDI r2, 70
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
