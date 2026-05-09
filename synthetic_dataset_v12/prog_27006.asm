; DESCRIPTION: Draws a cyan line from (61, 224) to (204, 128).
; PLAN: r0=61(x1), r1=224(y1), r2=204(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 224
LDI r2, 204
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
