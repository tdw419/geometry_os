; DESCRIPTION: Composite: Sets a single white pixel at (148, 11) then Renders a yellow line between points (443, 168) and (446, 184).
; PLAN: r0=148(x), r1=11(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=443(x1), r6=168(y1), r7=446(x2), r8=184(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 148
LDI r1, 11
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 443
LDI r6, 168
LDI r7, 446
LDI r8, 184
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
