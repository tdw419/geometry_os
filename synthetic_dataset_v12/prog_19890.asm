; DESCRIPTION: Draws a cyan line from (135, 95) to (397, 204).
; PLAN: r0=135(x1), r1=95(y1), r2=397(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 95
LDI r2, 397
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
