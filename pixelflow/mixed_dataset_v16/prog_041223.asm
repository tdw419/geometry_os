; DESCRIPTION: Renders a cyan line between points (289, 2) and (228, 30).
; PLAN: r0=289(x1), r1=2(y1), r2=228(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 2
LDI r2, 228
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
