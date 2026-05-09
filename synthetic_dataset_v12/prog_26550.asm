; DESCRIPTION: Composite: Draws a purple line from (50, 224) to (328, 135) then Creates a orange rectangular region at (404, 148) spanning 82 by 32 pixels.
; PLAN: r0=50(x1), r1=224(y1), r2=328(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=404(x), r6=148(y), r7=82(width), r8=32(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 50
LDI r1, 224
LDI r2, 328
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 148
LDI r7, 82
LDI r8, 32
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
