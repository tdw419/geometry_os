; DESCRIPTION: Renders a green line between points (356, 173) and (329, 60).
; PLAN: r0=356(x1), r1=173(y1), r2=329(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 173
LDI r2, 329
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
