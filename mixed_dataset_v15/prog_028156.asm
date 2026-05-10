; DESCRIPTION: Composite: Draws a black line from (145, 14) to (275, 95) then Renders a cyan box of size 52x32 starting at (434, 116).
; PLAN: r0=145(x1), r1=14(y1), r2=275(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=434(x), r6=116(y), r7=52(width), r8=32(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 14
LDI r2, 275
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 116
LDI r7, 52
LDI r8, 32
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
