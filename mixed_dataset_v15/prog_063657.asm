; DESCRIPTION: Composite: Renders a cyan line between points (164, 53) and (401, 41) then Creates a black rectangular region at (347, 13) spanning 19 by 95 pixels.
; PLAN: r0=164(x1), r1=53(y1), r2=401(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=347(x), r6=13(y), r7=19(width), r8=95(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 164
LDI r1, 53
LDI r2, 401
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 13
LDI r7, 19
LDI r8, 95
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
