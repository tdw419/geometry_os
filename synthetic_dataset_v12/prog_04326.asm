; DESCRIPTION: Composite: Draws a magenta line from (510, 218) to (410, 7) then Places a yellow 50x10 rectangle at position (109, 34).
; PLAN: r0=510(x1), r1=218(y1), r2=410(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=34(y), r7=50(width), r8=10(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 510
LDI r1, 218
LDI r2, 410
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 34
LDI r7, 50
LDI r8, 10
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
