; DESCRIPTION: Composite: Renders a cyan box of size 85x23 starting at (379, 191) then Draws a orange line from (477, 120) to (178, 153).
; PLAN: r0=379(x), r1=191(y), r2=85(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=477(x1), r6=120(y1), r7=178(x2), r8=153(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 379
LDI r1, 191
LDI r2, 85
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 477
LDI r6, 120
LDI r7, 178
LDI r8, 153
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
