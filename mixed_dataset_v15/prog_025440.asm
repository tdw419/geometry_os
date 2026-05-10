; DESCRIPTION: Renders a cyan line between points (173, 80) and (307, 13).
; PLAN: r0=173(x1), r1=80(y1), r2=307(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 80
LDI r2, 307
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
