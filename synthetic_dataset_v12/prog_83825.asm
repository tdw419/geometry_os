; DESCRIPTION: Composite: Creates a red rectangular region at (423, 115) spanning 42 by 103 pixels then Places a magenta dot at position (243, 133) then Draws a white line from (410, 240) to (90, 224).
; PLAN: r0=423(x), r1=115(y), r2=42(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=243(x), r6=133(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=410(x1), r11=240(y1), r12=90(x2), r13=224(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 423
LDI r1, 115
LDI r2, 42
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 133
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 410
LDI r11, 240
LDI r12, 90
LDI r13, 224
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
