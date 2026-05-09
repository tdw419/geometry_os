; DESCRIPTION: Renders a cyan line between points (367, 15) and (153, 228).
; PLAN: r0=367(x1), r1=15(y1), r2=153(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 15
LDI r2, 153
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
