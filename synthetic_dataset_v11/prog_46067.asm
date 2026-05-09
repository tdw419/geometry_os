; DESCRIPTION: Renders a cyan line between points (173, 101) and (176, 28).
; PLAN: r0=173(x1), r1=101(y1), r2=176(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 101
LDI r2, 176
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
