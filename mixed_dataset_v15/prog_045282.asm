; DESCRIPTION: Draws a cyan line from (271, 63) to (380, 202).
; PLAN: r0=271(x1), r1=63(y1), r2=380(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 63
LDI r2, 380
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
