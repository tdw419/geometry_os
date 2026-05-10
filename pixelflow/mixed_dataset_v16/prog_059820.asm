; DESCRIPTION: Composite: Sets a single purple pixel at (433, 75) then Renders a orange line between points (288, 74) and (86, 164) then Renders a red box of size 90x113 starting at (242, 50).
; PLAN: r0=433(x), r1=75(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=288(x1), r6=74(y1), r7=86(x2), r8=164(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=242(x), r11=50(y), r12=90(width), r13=113(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 433
LDI r1, 75
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 288
LDI r6, 74
LDI r7, 86
LDI r8, 164
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 242
LDI r11, 50
LDI r12, 90
LDI r13, 113
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
