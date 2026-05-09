; DESCRIPTION: Draws a cyan line from (435, 134) to (371, 243).
; PLAN: r0=435(x1), r1=134(y1), r2=371(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 134
LDI r2, 371
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
