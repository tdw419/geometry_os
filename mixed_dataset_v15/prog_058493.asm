; DESCRIPTION: Composite: Renders a green disk with center (60, 126) and radius 60 then Renders a red box of size 41x40 starting at (363, 12).
; PLAN: r0=60(x), r1=126(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x), r6=12(y), r7=41(width), r8=40(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 60
LDI r1, 126
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 12
LDI r7, 41
LDI r8, 40
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
