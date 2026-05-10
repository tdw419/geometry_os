; DESCRIPTION: Composite: Creates a red rectangular region at (343, 152) spanning 41 by 83 pixels then Places a cyan line segment connecting (460, 129) to (352, 151).
; PLAN: r0=343(x), r1=152(y), r2=41(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=460(x1), r6=129(y1), r7=352(x2), r8=151(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 152
LDI r2, 41
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 129
LDI r7, 352
LDI r8, 151
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
