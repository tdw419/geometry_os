; DESCRIPTION: Places a cyan line segment connecting (481, 196) to (230, 48).
; PLAN: r0=481(x1), r1=196(y1), r2=230(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 196
LDI r2, 230
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
