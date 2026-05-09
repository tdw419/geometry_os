; DESCRIPTION: Renders a cyan line between points (72, 48) and (214, 173).
; PLAN: r0=72(x1), r1=48(y1), r2=214(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 48
LDI r2, 214
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
