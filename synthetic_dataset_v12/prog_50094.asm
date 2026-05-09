; DESCRIPTION: Composite: Places a cyan dot at position (453, 238) then Places a blue 41x24 rectangle at position (450, 226) then Places a cyan line segment connecting (343, 120) to (119, 150).
; PLAN: r0=453(x), r1=238(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=450(x), r6=226(y), r7=41(width), r8=24(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=343(x1), r11=120(y1), r12=119(x2), r13=150(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 453
LDI r1, 238
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 450
LDI r6, 226
LDI r7, 41
LDI r8, 24
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 120
LDI r12, 119
LDI r13, 150
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
