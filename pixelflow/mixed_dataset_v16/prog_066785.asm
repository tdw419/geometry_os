; DESCRIPTION: Composite: Renders a red box of size 42x92 starting at (1, 52) then Renders a blue line between points (431, 247) and (391, 208).
; PLAN: r0=1(x), r1=52(y), r2=42(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=431(x1), r6=247(y1), r7=391(x2), r8=208(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 1
LDI r1, 52
LDI r2, 42
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 247
LDI r7, 391
LDI r8, 208
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
