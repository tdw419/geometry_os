; DESCRIPTION: Draws a cyan line from (214, 121) to (384, 204).
; PLAN: r0=214(x1), r1=121(y1), r2=384(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 121
LDI r2, 384
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
