; DESCRIPTION: Composite: Draws a cyan line from (476, 124) to (100, 245) then Creates a magenta rectangular region at (293, 159) spanning 16 by 76 pixels.
; PLAN: r0=476(x1), r1=124(y1), r2=100(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=159(y), r7=16(width), r8=76(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 476
LDI r1, 124
LDI r2, 100
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 159
LDI r7, 16
LDI r8, 76
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
