; DESCRIPTION: Composite: Draws a orange line from (174, 101) to (18, 127) then Renders a cyan box of size 24x76 starting at (58, 30).
; PLAN: r0=174(x1), r1=101(y1), r2=18(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=58(x), r6=30(y), r7=24(width), r8=76(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 174
LDI r1, 101
LDI r2, 18
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 30
LDI r7, 24
LDI r8, 76
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
