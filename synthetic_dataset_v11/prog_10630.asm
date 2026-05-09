; DESCRIPTION: Places a cyan line segment connecting (206, 209) to (216, 243).
; PLAN: r0=206(x1), r1=209(y1), r2=216(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 209
LDI r2, 216
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
