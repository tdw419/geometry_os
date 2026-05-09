; DESCRIPTION: Composite: Places a cyan dot at position (127, 95) then Creates a purple rectangular region at (7, 186) spanning 82 by 34 pixels then Places a green line segment connecting (405, 214) to (293, 33).
; PLAN: r0=127(x), r1=95(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=7(x), r6=186(y), r7=82(width), r8=34(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=405(x1), r11=214(y1), r12=293(x2), r13=33(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 95
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 7
LDI r6, 186
LDI r7, 82
LDI r8, 34
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 214
LDI r12, 293
LDI r13, 33
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
