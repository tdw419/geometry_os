; DESCRIPTION: Composite: Places a cyan line segment connecting (428, 188) to (395, 202) then Renders a magenta box of size 63x28 starting at (203, 50).
; PLAN: r0=428(x1), r1=188(y1), r2=395(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=203(x), r6=50(y), r7=63(width), r8=28(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 428
LDI r1, 188
LDI r2, 395
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 50
LDI r7, 63
LDI r8, 28
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
