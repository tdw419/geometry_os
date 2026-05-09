; DESCRIPTION: Composite: Places a white dot at position (103, 77) then Places a orange 98x109 rectangle at position (211, 126) then Renders a purple disk with center (401, 168) and radius 80.
; PLAN: r0=103(x), r1=77(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=211(x), r6=126(y), r7=98(width), r8=109(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=401(x), r11=168(y), r12=80(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 103
LDI r1, 77
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 211
LDI r6, 126
LDI r7, 98
LDI r8, 109
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 401
LDI r11, 168
LDI r12, 80
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
