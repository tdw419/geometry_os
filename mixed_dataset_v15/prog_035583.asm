; DESCRIPTION: Renders a cyan line between points (421, 152) and (164, 90).
; PLAN: r0=421(x1), r1=152(y1), r2=164(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 152
LDI r2, 164
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
