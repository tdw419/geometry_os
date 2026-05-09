; DESCRIPTION: Renders a cyan line between points (289, 249) and (352, 44).
; PLAN: r0=289(x1), r1=249(y1), r2=352(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 249
LDI r2, 352
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
