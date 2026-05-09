; DESCRIPTION: Composite: Renders a purple disk with center (401, 133) and radius 24 then Renders a cyan line between points (157, 148) and (236, 97).
; PLAN: r0=401(x), r1=133(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x1), r6=148(y1), r7=236(x2), r8=97(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 133
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 148
LDI r7, 236
LDI r8, 97
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
