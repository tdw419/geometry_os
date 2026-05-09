; DESCRIPTION: Renders a cyan line between points (413, 228) and (44, 255).
; PLAN: r0=413(x1), r1=228(y1), r2=44(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 228
LDI r2, 44
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
