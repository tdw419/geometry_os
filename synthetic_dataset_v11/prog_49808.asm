; DESCRIPTION: Renders a cyan line between points (165, 33) and (126, 174).
; PLAN: r0=165(x1), r1=33(y1), r2=126(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 33
LDI r2, 126
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
