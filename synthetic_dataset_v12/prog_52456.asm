; DESCRIPTION: Composite: Renders a cyan line between points (57, 48) and (391, 121) then Sets a single green pixel at (229, 168) then Draws a green rectangle at (284, 214) with width 48 and height 42.
; PLAN: r0=57(x1), r1=48(y1), r2=391(x2), r3=121(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=229(x), r6=168(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=284(x), r11=214(y), r12=48(width), r13=42(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 57
LDI r1, 48
LDI r2, 391
LDI r3, 121
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 168
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 284
LDI r11, 214
LDI r12, 48
LDI r13, 42
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
