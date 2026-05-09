; DESCRIPTION: Composite: Renders a magenta box of size 51x62 starting at (336, 194) then Renders a cyan disk with center (352, 184) and radius 34.
; PLAN: r0=336(x), r1=194(y), r2=51(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=352(x), r6=184(y), r7=34(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 336
LDI r1, 194
LDI r2, 51
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 184
LDI r7, 34
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
