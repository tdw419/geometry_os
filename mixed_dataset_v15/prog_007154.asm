; DESCRIPTION: Composite: Renders a magenta box of size 102x67 starting at (85, 100) then Places a black dot at position (198, 124) then Draws a magenta line from (262, 211) to (242, 239).
; PLAN: r0=85(x), r1=100(y), r2=102(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x), r6=124(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=262(x1), r11=211(y1), r12=242(x2), r13=239(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 85
LDI r1, 100
LDI r2, 102
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 124
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 262
LDI r11, 211
LDI r12, 242
LDI r13, 239
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
