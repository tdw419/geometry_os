; DESCRIPTION: Draws a cyan line from (44, 209) to (481, 90).
; PLAN: r0=44(x1), r1=209(y1), r2=481(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 209
LDI r2, 481
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
