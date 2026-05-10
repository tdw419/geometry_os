; DESCRIPTION: Composite: Renders a orange box of size 98x27 starting at (300, 137) then Draws a cyan line from (277, 8) to (341, 60).
; PLAN: r0=300(x), r1=137(y), r2=98(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x1), r6=8(y1), r7=341(x2), r8=60(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 300
LDI r1, 137
LDI r2, 98
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 8
LDI r7, 341
LDI r8, 60
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
