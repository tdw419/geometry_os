; DESCRIPTION: Composite: Places a blue line segment connecting (252, 5) to (416, 247) then Creates a red rectangular region at (307, 205) spanning 37 by 32 pixels.
; PLAN: r0=252(x1), r1=5(y1), r2=416(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=205(y), r7=37(width), r8=32(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 252
LDI r1, 5
LDI r2, 416
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 205
LDI r7, 37
LDI r8, 32
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
