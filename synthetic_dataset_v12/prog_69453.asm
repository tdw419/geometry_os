; DESCRIPTION: Composite: Renders a white disk with center (73, 213) and radius 30 then Renders a black line between points (443, 42) and (259, 210).
; PLAN: r0=73(x), r1=213(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=443(x1), r6=42(y1), r7=259(x2), r8=210(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 73
LDI r1, 213
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 443
LDI r6, 42
LDI r7, 259
LDI r8, 210
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
