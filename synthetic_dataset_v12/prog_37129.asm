; DESCRIPTION: Renders a green line between points (397, 224) and (439, 236).
; PLAN: r0=397(x1), r1=224(y1), r2=439(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 224
LDI r2, 439
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
