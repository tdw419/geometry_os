; DESCRIPTION: Draws a cyan line from (21, 253) to (36, 146).
; PLAN: r0=21(x1), r1=253(y1), r2=36(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 253
LDI r2, 36
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
