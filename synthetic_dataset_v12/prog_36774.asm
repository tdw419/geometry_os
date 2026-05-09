; DESCRIPTION: Composite: Places a green 95x25 rectangle at position (368, 151) then Renders a cyan disk with center (111, 202) and radius 42 then Draws a red line from (162, 57) to (342, 162).
; PLAN: r0=368(x), r1=151(y), r2=95(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=111(x), r6=202(y), r7=42(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=162(x1), r11=57(y1), r12=342(x2), r13=162(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 368
LDI r1, 151
LDI r2, 95
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 202
LDI r7, 42
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 162
LDI r11, 57
LDI r12, 342
LDI r13, 162
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
