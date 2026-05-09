; DESCRIPTION: Renders a cyan line between points (356, 5) and (239, 171).
; PLAN: r0=356(x1), r1=5(y1), r2=239(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 5
LDI r2, 239
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
