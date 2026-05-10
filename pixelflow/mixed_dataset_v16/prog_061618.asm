; DESCRIPTION: Composite: Renders a cyan disk with center (280, 120) and radius 58 then Draws a green line from (256, 143) to (502, 247) then Renders a white box of size 105x11 starting at (247, 75).
; PLAN: r0=280(x), r1=120(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=256(x1), r6=143(y1), r7=502(x2), r8=247(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=247(x), r11=75(y), r12=105(width), r13=11(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 120
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 256
LDI r6, 143
LDI r7, 502
LDI r8, 247
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 247
LDI r11, 75
LDI r12, 105
LDI r13, 11
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
