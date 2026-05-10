; DESCRIPTION: Renders a cyan line between points (173, 50) and (144, 244).
; PLAN: r0=173(x1), r1=50(y1), r2=144(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 50
LDI r2, 144
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
