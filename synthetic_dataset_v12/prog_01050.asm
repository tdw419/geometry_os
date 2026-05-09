; DESCRIPTION: Composite: Places a white line segment connecting (64, 237) to (186, 134) then Renders a orange box of size 55x56 starting at (103, 132).
; PLAN: r0=64(x1), r1=237(y1), r2=186(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=132(y), r7=55(width), r8=56(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 64
LDI r1, 237
LDI r2, 186
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 132
LDI r7, 55
LDI r8, 56
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
