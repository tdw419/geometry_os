; DESCRIPTION: Composite: Places a white dot at position (74, 206) then Places a blue 35x53 rectangle at position (109, 44).
; PLAN: r0=74(x), r1=206(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=109(x), r6=44(y), r7=35(width), r8=53(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 74
LDI r1, 206
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 109
LDI r6, 44
LDI r7, 35
LDI r8, 53
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
