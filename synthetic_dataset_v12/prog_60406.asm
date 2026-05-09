; DESCRIPTION: Composite: Creates a cyan circular shape at (353, 184) with radius 46 then Renders a yellow line between points (446, 12) and (382, 113).
; PLAN: r0=353(x), r1=184(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x1), r6=12(y1), r7=382(x2), r8=113(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 353
LDI r1, 184
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 12
LDI r7, 382
LDI r8, 113
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
