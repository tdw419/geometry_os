; DESCRIPTION: Draws a cyan line from (403, 97) to (397, 54).
; PLAN: r0=403(x1), r1=97(y1), r2=397(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 97
LDI r2, 397
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
