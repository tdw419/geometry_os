; DESCRIPTION: Composite: Sets a single black pixel at (173, 213) then Places a green 51x48 rectangle at position (260, 158).
; PLAN: r0=173(x), r1=213(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=260(x), r6=158(y), r7=51(width), r8=48(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 173
LDI r1, 213
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 260
LDI r6, 158
LDI r7, 51
LDI r8, 48
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
