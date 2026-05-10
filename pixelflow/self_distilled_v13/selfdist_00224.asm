; DESCRIPTION: Draws a cyan line from (175, 27) to (132, 33).
; PLAN: r0=175(x1), r1=27(y1), r2=132(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 27
LDI r2, 132
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
