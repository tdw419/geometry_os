; DESCRIPTION: Draws a cyan line from (284, 159) to (179, 234).
; PLAN: r0=284(x1), r1=159(y1), r2=179(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 159
LDI r2, 179
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
