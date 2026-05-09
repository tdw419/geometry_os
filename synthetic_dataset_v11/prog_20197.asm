; DESCRIPTION: Renders a cyan line between points (66, 228) and (206, 38).
; PLAN: r0=66(x1), r1=228(y1), r2=206(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 228
LDI r2, 206
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
