; DESCRIPTION: Draws a cyan line from (344, 141) to (256, 32).
; PLAN: r0=344(x1), r1=141(y1), r2=256(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 141
LDI r2, 256
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
