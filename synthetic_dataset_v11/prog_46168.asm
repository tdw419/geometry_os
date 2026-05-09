; DESCRIPTION: Draws a cyan line from (183, 64) to (197, 202).
; PLAN: r0=183(x1), r1=64(y1), r2=197(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 64
LDI r2, 197
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
