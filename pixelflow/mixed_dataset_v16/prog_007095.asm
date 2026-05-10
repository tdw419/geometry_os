; DESCRIPTION: Composite: Creates a cyan rectangular region at (115, 100) spanning 113 by 109 pixels then Places a cyan circle of radius 67 at center (299, 170) then Renders a cyan line between points (124, 47) and (98, 83).
; PLAN: r0=115(x), r1=100(y), r2=113(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x), r6=170(y), r7=67(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=124(x1), r11=47(y1), r12=98(x2), r13=83(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 100
LDI r2, 113
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 170
LDI r7, 67
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 124
LDI r11, 47
LDI r12, 98
LDI r13, 83
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
