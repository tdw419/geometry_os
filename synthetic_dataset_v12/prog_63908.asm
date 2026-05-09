; DESCRIPTION: Composite: Renders a red box of size 71x16 starting at (231, 28) then Draws a magenta line from (85, 61) to (252, 223).
; PLAN: r0=231(x), r1=28(y), r2=71(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x1), r6=61(y1), r7=252(x2), r8=223(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 231
LDI r1, 28
LDI r2, 71
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 61
LDI r7, 252
LDI r8, 223
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
