; DESCRIPTION: Composite: Renders a cyan disk with center (120, 121) and radius 76 then Renders a green box of size 103x61 starting at (55, 149).
; PLAN: r0=120(x), r1=121(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=55(x), r6=149(y), r7=103(width), r8=61(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 120
LDI r1, 121
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 55
LDI r6, 149
LDI r7, 103
LDI r8, 61
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
