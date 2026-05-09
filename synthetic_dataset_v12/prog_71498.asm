; DESCRIPTION: Composite: Places a cyan line segment connecting (401, 140) to (202, 215) then Places a green circle of radius 29 at center (457, 122).
; PLAN: r0=401(x1), r1=140(y1), r2=202(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=457(x), r6=122(y), r7=29(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 401
LDI r1, 140
LDI r2, 202
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 122
LDI r7, 29
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
