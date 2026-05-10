; DESCRIPTION: Draws a cyan line from (60, 215) to (117, 46).
; PLAN: r0=60(x1), r1=215(y1), r2=117(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 215
LDI r2, 117
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
