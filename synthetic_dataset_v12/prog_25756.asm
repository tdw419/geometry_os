; DESCRIPTION: Composite: Places a magenta 61x71 rectangle at position (122, 54) then Places a cyan line segment connecting (251, 95) to (450, 192).
; PLAN: r0=122(x), r1=54(y), r2=61(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=251(x1), r6=95(y1), r7=450(x2), r8=192(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 122
LDI r1, 54
LDI r2, 61
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 95
LDI r7, 450
LDI r8, 192
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
