; DESCRIPTION: Composite: Places a white dot at position (114, 128) then Places a blue 13x111 rectangle at position (46, 113).
; PLAN: r0=114(x), r1=128(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=46(x), r6=113(y), r7=13(width), r8=111(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 114
LDI r1, 128
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 46
LDI r6, 113
LDI r7, 13
LDI r8, 111
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
