; DESCRIPTION: Composite: Sets a single green pixel at (256, 46) then Renders a red box of size 55x22 starting at (336, 191).
; PLAN: r0=256(x), r1=46(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=336(x), r6=191(y), r7=55(width), r8=22(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 46
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 336
LDI r6, 191
LDI r7, 55
LDI r8, 22
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
