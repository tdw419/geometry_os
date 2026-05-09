; DESCRIPTION: Draws a cyan line from (346, 219) to (466, 168).
; PLAN: r0=346(x1), r1=219(y1), r2=466(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 219
LDI r2, 466
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
