; DESCRIPTION: Draws a cyan line from (126, 178) to (0, 222).
; PLAN: r0=126(x1), r1=178(y1), r2=0(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 178
LDI r2, 0
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
