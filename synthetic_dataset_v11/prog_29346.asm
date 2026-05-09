; DESCRIPTION: Draws a cyan line from (107, 196) to (123, 227).
; PLAN: r0=107(x1), r1=196(y1), r2=123(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 196
LDI r2, 123
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
