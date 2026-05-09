; DESCRIPTION: Composite: Places a orange 38x100 rectangle at position (108, 145) then Places a red dot at position (274, 41) then Renders a green line between points (200, 122) and (502, 253).
; PLAN: r0=108(x), r1=145(y), r2=38(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=274(x), r6=41(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=200(x1), r11=122(y1), r12=502(x2), r13=253(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 145
LDI r2, 38
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 41
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 200
LDI r11, 122
LDI r12, 502
LDI r13, 253
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
