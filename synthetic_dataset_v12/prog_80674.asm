; DESCRIPTION: Draws a cyan line from (288, 27) to (248, 32).
; PLAN: r0=288(x1), r1=27(y1), r2=248(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 27
LDI r2, 248
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
