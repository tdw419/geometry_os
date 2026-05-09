; DESCRIPTION: Renders a cyan line between points (196, 173) and (101, 237).
; PLAN: r0=196(x1), r1=173(y1), r2=101(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 173
LDI r2, 101
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
