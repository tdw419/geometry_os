; DESCRIPTION: Composite: Places a blue line segment connecting (336, 112) to (374, 143) then Renders a green box of size 12x86 starting at (394, 116).
; PLAN: r0=336(x1), r1=112(y1), r2=374(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=394(x), r6=116(y), r7=12(width), r8=86(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 336
LDI r1, 112
LDI r2, 374
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 116
LDI r7, 12
LDI r8, 86
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
