; DESCRIPTION: Composite: Places a white dot at position (263, 52) then Renders a purple box of size 47x73 starting at (253, 121).
; PLAN: r0=263(x), r1=52(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=253(x), r6=121(y), r7=47(width), r8=73(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 52
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 253
LDI r6, 121
LDI r7, 47
LDI r8, 73
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
