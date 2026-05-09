; DESCRIPTION: Renders a cyan line between points (414, 56) and (51, 228).
; PLAN: r0=414(x1), r1=56(y1), r2=51(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 56
LDI r2, 51
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
