; DESCRIPTION: Composite: Places a cyan circle of radius 60 at center (443, 168) then Creates a red rectangular region at (319, 148) spanning 36 by 102 pixels.
; PLAN: r0=443(x), r1=168(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=319(x), r6=148(y), r7=36(width), r8=102(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 443
LDI r1, 168
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 319
LDI r6, 148
LDI r7, 36
LDI r8, 102
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
