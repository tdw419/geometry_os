; DESCRIPTION: Composite: Sets a single orange pixel at (270, 157) then Renders a red line between points (335, 103) and (417, 238) then Places a cyan 117x80 rectangle at position (346, 39).
; PLAN: r0=270(x), r1=157(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=335(x1), r6=103(y1), r7=417(x2), r8=238(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=346(x), r11=39(y), r12=117(width), r13=80(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 157
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 335
LDI r6, 103
LDI r7, 417
LDI r8, 238
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 39
LDI r12, 117
LDI r13, 80
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
