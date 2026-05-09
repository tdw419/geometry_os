; DESCRIPTION: Renders a cyan line between points (480, 102) and (356, 67).
; PLAN: r0=480(x1), r1=102(y1), r2=356(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 102
LDI r2, 356
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
