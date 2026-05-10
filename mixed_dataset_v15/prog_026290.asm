; DESCRIPTION: Composite: Places a cyan dot at position (35, 221) then Renders a cyan line between points (433, 48) and (33, 206) then Creates a magenta rectangular region at (142, 67) spanning 104 by 67 pixels.
; PLAN: r0=35(x), r1=221(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=433(x1), r6=48(y1), r7=33(x2), r8=206(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=142(x), r11=67(y), r12=104(width), r13=67(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 35
LDI r1, 221
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 433
LDI r6, 48
LDI r7, 33
LDI r8, 206
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 67
LDI r12, 104
LDI r13, 67
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
