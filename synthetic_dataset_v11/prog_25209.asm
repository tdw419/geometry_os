; DESCRIPTION: Renders a cyan line between points (30, 86) and (128, 173).
; PLAN: r0=30(x1), r1=86(y1), r2=128(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 86
LDI r2, 128
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
