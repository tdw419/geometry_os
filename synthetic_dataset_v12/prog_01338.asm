; DESCRIPTION: Renders a cyan line between points (148, 228) and (443, 2).
; PLAN: r0=148(x1), r1=228(y1), r2=443(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 228
LDI r2, 443
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
