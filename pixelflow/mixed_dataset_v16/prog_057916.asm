; DESCRIPTION: Composite: Creates a cyan rectangular region at (173, 57) spanning 103 by 106 pixels then Places a red dot at position (498, 69) then Renders a black line between points (290, 164) and (291, 213).
; PLAN: r0=173(x), r1=57(y), r2=103(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=498(x), r6=69(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=290(x1), r11=164(y1), r12=291(x2), r13=213(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 57
LDI r2, 103
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 498
LDI r6, 69
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 290
LDI r11, 164
LDI r12, 291
LDI r13, 213
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
