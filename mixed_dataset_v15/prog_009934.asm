; DESCRIPTION: Composite: Sets a single white pixel at (193, 196) then Draws a red rectangle at (328, 120) with width 77 and height 38.
; PLAN: r0=193(x), r1=196(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=328(x), r6=120(y), r7=77(width), r8=38(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 196
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 328
LDI r6, 120
LDI r7, 77
LDI r8, 38
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
