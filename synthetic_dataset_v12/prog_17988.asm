; DESCRIPTION: Composite: Places a white dot at position (440, 112) then Places a green 72x36 rectangle at position (165, 79).
; PLAN: r0=440(x), r1=112(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=165(x), r6=79(y), r7=72(width), r8=36(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 440
LDI r1, 112
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 165
LDI r6, 79
LDI r7, 72
LDI r8, 36
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
