; DESCRIPTION: Composite: Places a cyan line segment connecting (173, 82) to (482, 250) then Places a white 27x111 rectangle at position (112, 112).
; PLAN: r0=173(x1), r1=82(y1), r2=482(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=112(y), r7=27(width), r8=111(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 173
LDI r1, 82
LDI r2, 482
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 112
LDI r7, 27
LDI r8, 111
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
