; DESCRIPTION: Draws a cyan line from (384, 17) to (282, 48).
; PLAN: r0=384(x1), r1=17(y1), r2=282(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 17
LDI r2, 282
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
