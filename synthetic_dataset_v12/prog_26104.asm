; DESCRIPTION: Composite: Renders a orange line between points (90, 146) and (285, 159) then Places a cyan 120x33 rectangle at position (356, 171).
; PLAN: r0=90(x1), r1=146(y1), r2=285(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=356(x), r6=171(y), r7=120(width), r8=33(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 90
LDI r1, 146
LDI r2, 285
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 171
LDI r7, 120
LDI r8, 33
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
