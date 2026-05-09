; DESCRIPTION: Draws a cyan line from (243, 218) to (16, 213).
; PLAN: r0=243(x1), r1=218(y1), r2=16(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 218
LDI r2, 16
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
