; DESCRIPTION: Composite: Creates a blue rectangular region at (291, 20) spanning 16 by 27 pixels then Places a yellow line segment connecting (252, 86) to (346, 243).
; PLAN: r0=291(x), r1=20(y), r2=16(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=252(x1), r6=86(y1), r7=346(x2), r8=243(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 20
LDI r2, 16
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 86
LDI r7, 346
LDI r8, 243
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
