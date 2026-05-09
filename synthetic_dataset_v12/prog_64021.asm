; DESCRIPTION: Composite: Places a orange dot at position (38, 62) then Draws a magenta line from (83, 221) to (502, 194) then Renders a orange box of size 34x99 starting at (281, 6).
; PLAN: r0=38(x), r1=62(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=83(x1), r6=221(y1), r7=502(x2), r8=194(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=281(x), r11=6(y), r12=34(width), r13=99(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 38
LDI r1, 62
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 83
LDI r6, 221
LDI r7, 502
LDI r8, 194
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 281
LDI r11, 6
LDI r12, 34
LDI r13, 99
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
