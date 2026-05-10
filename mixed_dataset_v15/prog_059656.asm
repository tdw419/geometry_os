; DESCRIPTION: Composite: Creates a orange circular shape at (158, 111) with radius 79 then Places a cyan 71x91 rectangle at position (406, 59) then Draws a cyan line from (240, 102) to (439, 124).
; PLAN: r0=158(x), r1=111(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x), r6=59(y), r7=71(width), r8=91(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=240(x1), r11=102(y1), r12=439(x2), r13=124(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 111
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 59
LDI r7, 71
LDI r8, 91
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 240
LDI r11, 102
LDI r12, 439
LDI r13, 124
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
